# Homework 3: one server, one web page, in code

**Time:** 45 minutes · **AWS services:** Amazon EC2, plus Amazon VPC's default VPC · **Free Tier:** unlike homework 1
and 2, this one creates a resource billed per running hour, so it can cost you money if you leave it running

## Goal

Provision one server, serve one page, then remove it.

Terraform creates a security group and a `t3.micro` EC2 instance in the default VPC, the instance installs nginx at
first boot and serves a page, you open that page in a browser, then `terraform destroy` removes everything it made.

## Prerequisites

- An AWS account ([create an AWS account](https://aws.amazon.com/resources/create-account/))
- The AWS CLI installed and configured with `aws configure`
  ([AWS CLI getting started](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html))
- Terraform 1.6.0 or later ([install Terraform](https://developer.hashicorp.com/terraform/install)) — this one is new,
  homework 1 and 2 did not need it. Check what you have with `terraform version`.

You need no SSH client and no EC2 key pair. The security group opens TCP 80 only and carries no port 22 rule, so there
is never a key to create, store or expose.

## What this costs

- A `t3.micro` on-demand instance in `ap-south-1` costs $0.0112 per hour
  ([EC2 on-demand pricing](https://aws.amazon.com/ec2/pricing/on-demand/), retrieved 2026-08-16).
- Forty-five minutes of that is under one US cent.
- The module uses the pre-existing default VPC and its first subnet, so it creates no VPC and no NAT gateway, and adds
  no further hourly charge.
- The 8 GiB encrypted gp3 root volume is deleted along with the instance, because the module sets
  `delete_on_termination = true`.
- The charge runs for as long as the instance runs, including the hours you spend away from the keyboard.

## Steps

1. **Set a $5 budget alert before you create anything.** This step is blocking: do it before `terraform apply`, not
   after. In the console, open Billing and Cost Management, then choose Budgets, then Create budget. Pick the cost
   budget type, set the period to monthly and the amount to $5, add an alert threshold at 80%, choose email as the
   notification channel, enter your own address, then create the budget
   ([create a budget](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-create.html)). A budget
   alert reports spending after it has happened, it does not block it. `terraform destroy` is the control that
   actually stops the charge.
2. **`cd homework/terraform-ec2-nginx`** Every Terraform command below runs from inside that directory.
3. **`terraform init`** downloads the AWS provider into the working directory. Run it once per directory.
4. **`terraform plan`** lists what will be created without creating any of it. The module defaults to `ap-south-1` and
   `t3.micro`, so you set no variables at all. It resolves the latest Amazon Linux 2023 image through a public AWS
   Systems Manager parameter, so no AMI ID is ever copied by hand.

   The `allowed_http_cidr` variable defaults to `0.0.0.0/0`, which means the page opens from any network, including a
   phone on mobile data — handy when you want to show someone the result. That default is a deliberate teaching
   shortcut for a server that lives 45 minutes and serves nothing private. It is not a habit to carry into later work,
   where you narrow inbound rules to the addresses that actually need them. If you would rather practise that now,
   `terraform apply -var="allowed_http_cidr=<MY_IP>/32"` restricts it to your own address. The instance requires
   IMDSv2, so its instance metadata is reachable only with a session token.

5. **`terraform apply`** asks for a typed confirmation before it changes anything; you type `yes`. When it finishes it
   prints the outputs, including `instance_id`, `public_ip`, `public_dns` and `page_url`.
6. **Open the `page_url` output in a browser.** The instance still has to boot and run `dnf install nginx` after apply
   returns, so the first load may fail. Wait roughly 60 to 90 seconds and reload.
7. **`terraform destroy`** removes everything the configuration created; you type `yes` again.

## Artifact

The nginx page loading in a browser at the `page_url` address, plus the printed `instance_id` and `public_ip`.

Nothing here survives teardown, and there is no git push step: the artifact is the running page and the outputs you
read. If your terminal scrolls away, `terraform output` reprints them.

## Check it works

```bash
terraform output page_url
curl -s "$(terraform output -raw page_url)"
```

Open that URL in a browser, or read it with `curl`. The page comes from `user_data.sh` and carries an `<h1>` reading
`Cloud Foundations to Career Futures` — that is `local.tags.Session`, passed into the template as `session_title` — then
`AWS Student Builder Group — Amity University Bengaluru`, then `Online session, Sunday 16 August 2026, 15:30 IST`, then
a line telling you to run `terraform destroy` when you are done.

## Teardown

```bash
terraform destroy
```

Type `yes` at the confirmation. It removes the instance, the security group and the root volume.

## Check teardown worked

```bash
aws ec2 describe-instances --instance-ids <INSTANCE_ID> \
  --query 'Reservations[].Instances[].State.Name' --output text --region ap-south-1

terraform state list
```

The first command prints `terminated`, or it fails with `InvalidInstanceID.NotFound` once AWS has aged the record out,
and that failure is the pass. A terminated instance stays visible for a while, up to about an hour, before the record
disappears, so if it still reports `shutting-down`, wait and run it again. If it still reports `running` after that, the
instance is still there: run the teardown again. The second command returns nothing, which means the state file tracks
no resources any more.

## If something goes wrong

- `terraform: command not found`: Terraform is not installed, or not on your `PATH`. Install it, then confirm with
  `terraform version`.
- `Error: Unsupported Terraform Core version`: your Terraform is older than 1.6.0, which this module requires. Upgrade
  it and run `terraform version` again.
- `Unable to locate credentials`, or `No valid credential sources found`: the AWS CLI has no credentials yet. Run
  `aws configure`, then confirm with `aws sts get-caller-identity`.
- The browser cannot reach `page_url` and the connection times out: the instance is still booting and installing
  nginx. Wait 60 to 90 seconds and reload. Also confirm you are on the `http://` URL, not `https://` — nginx serves
  plain HTTP here.
- `Error: no matching VPC found`: the account or the Region has no default VPC, and this module depends on one. Create
  it ([default VPC](https://docs.aws.amazon.com/vpc/latest/userguide/work-with-default-vpc.html)) and apply again.
- `UnauthorizedOperation`: the identity you configured lacks EC2 permission. Check which identity you are using with
  `aws sts get-caller-identity`.
- `terraform apply` failed partway through: run it again. Terraform continues from the state it recorded rather than
  starting over, so the resources it already created are reused.
- You lost the outputs: `terraform output` reprints all of them, and `terraform output -raw page_url` prints just the
  URL.
- `terraform destroy` says there is nothing to destroy, but you still see the instance in the console: you are in the
  wrong directory, or the state file is gone. Find the instance by its `Name` tag, `cloud-foundations-nginx`, then
  terminate it by ID with `aws ec2 terminate-instances --instance-ids <INSTANCE_ID> --region ap-south-1`.
