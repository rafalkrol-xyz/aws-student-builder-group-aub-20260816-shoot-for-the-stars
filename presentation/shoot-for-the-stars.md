---
title: Shoot For The Stars
sub_title: "AWS Student Builder Group at Amity University Bengaluru: Cloud Foundations to Career Futures"
author: Rafał Król — Head of AWS Technologies @ Trek2Summit
theme:
  name: catppuccin-mocha
options:
  end_slide_shorthand: false
  implicit_slide_ends: false
  strict_front_matter_parsing: true
---

Welcome
=======

- Title: Shoot For The Stars
- Series: Cloud Foundations to Career Futures
- Group: AWS Student Builder Group — Amity University Bengaluru
- Amazon Web Services (AWS): The Public Cloud ([what is AWS](https://aws.amazon.com/what-is-aws/))
- Online session · Sunday 16 August 2026 · 15:30 India Standard Time (IST)

![welcome:width:100%](../images/welcome.jpeg)

<!-- end_slide -->

Agenda
======

1. whoami
2. Foundations you can practise free
3. AWS core building blocks
4. Tools and infrastructure as code
5. Spend nothing by accident
6. Career moves
7. Homework

This session assumes no prior AWS account, no prior AWS service usage, and no prior command-line experience.

<!-- end_slide -->

whoami
======================================

I've been working with AWS for over a decade, I passed 14 AWS certification exams, I am an AWS Community Builder, I run an AWS Department for an AWS Partner company - what was my first full-time role?

<!-- pause -->
<!-- column_layout: [2, 2] -->
<!-- column: 0 -->
![airbus:width:100%](../images/spa_airbus_a320.jpeg)
<!-- column: 1 -->
![flight attendant:width:100%](../images/flight_attendant.jpeg)

<!-- end_slide -->

Every app has four parts
========================

Every app you build mixes these four parts.

- Storage: keeps files and data safe after your program stops running.
- Compute: runs your code, the processor time that does the actual work.
- Network: moves requests between users, your code, and stored data.
- Artificial intelligence (AI): adds prediction and language skills to apps.

<!-- end_slide -->

Linux: find your way around a filesystem
========================================

Linux is the operating system most cloud servers run. You type commands into a shell, the text program that runs them ([coreutils manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)).

- `cd`, `ls -la`: move between folders, list everything with sizes and dates.
- `cat`, `head`, `wc -l`: print a file, print its top, count its lines.

```bash
cd <PROJECT_DIR> # e.g. `cd ~/main/priv/aws-student-builder-group-aub-20260816-shoot-for-the-stars`
ls -la
cat README.md
head -n 20 presentation/shoot-for-the-stars.md
wc -l README.md
wc -l images/*
less presentation/shoot-for-the-stars.md
```

**⭐ Official learning material: [Introduction to Linux](https://training.linuxfoundation.org/training/introduction-to-linux/) ⭐**

<!-- end_slide -->

Containers: build once, run anywhere
====================================

A container packs your code and everything it needs into one unit that runs the same on any machine. Docker builds and runs them ([Docker docs](https://docs.docker.com/reference/cli/docker/)).

- `docker build`: turns a `Dockerfile` recipe into a reusable image.
- `docker run`: starts a container from that image on your own machine.

```bash
cd homework/docker-hi-bengaluru
docker build -t hi-ben .
docker run --rm -p 8080:80 hi-ben:latest
curl localhost:8080 # or open localhost:8080 in your browser
docker ps # do it in a separate terminal window while the container is running
docker rmi hi-ben:latest
```

**⭐ Official learning material: [Docker 101](https://www.docker.com/101-tutorial/) ⭐**

<!-- end_slide -->

git and GitHub: save and share your work
========================================

git records every version of your files so you can go back. GitHub hosts those records online so other people read and copy them ([git docs](https://git-scm.com/doc), [GitHub docs](https://docs.github.com/en/get-started)).

- `git clone`: copies a hosted project onto your own machine.
- `git commit`: saves your staged changes as one labelled version.
- `git push`: sends your saved versions back to GitHub.

```bash
git clone https://github.com/<GITHUB_USER>/<REPO_NAME>.git
cd <REPO_NAME>
git add .
git commit -m "Add my first change"
git push origin main
```

**⭐ Official learning material: [GitHub learn](https://learn.github.com/) ⭐**

<!-- end_slide -->

The five AWS services to learn first
====================================

Two services come before all the others.

- Network: Amazon Virtual Private Cloud (VPC), your isolated network ([VPC](https://aws.amazon.com/vpc/))
- Every part: AWS Identity and Access Management (IAM) decides who may act ([IAM](https://aws.amazon.com/iam/))

⭐ My video presenting the AWS Console experience: [AWS Primer | Logged in, now what?](https://www.youtube.com/watch?v=zpPDw_abgqc) ⭐

<!-- end_slide -->

The five AWS services to learn first, continued
===============================================

Then the three that run your code and hold your data.

- Compute: Amazon Elastic Compute Cloud (EC2) lets you launch virtual servers on demand. ([EC2](https://aws.amazon.com/ec2/))
- Storage: Amazon Simple Storage Service (S3) keeps files you upload ([S3](https://aws.amazon.com/s3/))
- Network: Amazon Simple Queue Service (SQS) holds messages between programs ([SQS](https://aws.amazon.com/sqs/))

<!-- end_slide -->

Your first two AWS CLI commands
===============================

The AWS Command Line Interface (AWS CLI) is a program you type into to run AWS actions from your own machine ([AWS CLI](https://aws.amazon.com/cli/)).

- `aws sts get-caller-identity`: shows which account and identity your commands use.
- `aws s3 ls`: lists every S3 bucket that same account owns.

```bash
aws --version
aws configure list
aws sts get-caller-identity
aws s3 ls
aws s3 ls s3://<BUCKET_NAME>
```

**⭐ Official learning material: [AWS CLI getting started](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) ⭐**

<!-- end_slide -->

Next stops after the core five
==============================

These four are extension topics beyond the core five services.

- AWS Lambda: runs short pieces of code without any server to manage ([Lambda](https://aws.amazon.com/lambda/))
- Amazon Elastic Container Service (ECS): runs containers as long-lived services ([ECS](https://aws.amazon.com/ecs/))
- AWS Fargate: runs those containers without servers you patch ([Fargate](https://aws.amazon.com/fargate/))
- Amazon Bedrock: adds hosted AI models to your apps ([Bedrock](https://aws.amazon.com/bedrock/))

<!-- end_slide -->

Tools that cost you nothing to start
====================================

Every tool here has a no-cost option.

- Kiro: an AI editor that codes from your spec; free tier ([Kiro pricing](https://kiro.dev/pricing/))
- Docker Desktop: runs Docker locally, free for personal use ([Docker pricing](https://www.docker.com/pricing/))
- GitHub: Free plan, unlimited public and private repositories ([GitHub plans](https://docs.github.com/en/get-started/learning-about-github/githubs-plans))
- Visual Studio Code: a free editor, the Kiro alternative ([Visual Studio Code](https://code.visualstudio.com/docs/copilot/overview))
- GitHub Copilot Free: AI coding help at no cost ([Copilot Free plan](https://docs.github.com/en/copilot/about-github-copilot/plans-for-github-copilot))

<!-- end_slide -->

Infrastructure as code: three options
=====================================

Infrastructure as code (IaC): your cloud setup written in files kept in git.

- Terraform: HashiCorp's tool, its own configuration language ([Terraform docs](https://developer.hashicorp.com/terraform/docs))
- OpenTofu: an open-source fork of Terraform, community governed ([OpenTofu](https://opentofu.org/docs/))
- Pulumi: same setup in languages you know: Python, TypeScript, Go ([Pulumi](https://www.pulumi.com/docs/))

All three build on AWS; this session uses Terraform.

<!-- end_slide -->

One server, one web page, in code
================================

Terraform describes the server in files. `terraform apply` builds it, `terraform destroy` removes it. These lines come from `homework/terraform-ec2-nginx/` ([AWS provider docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)).

- `resource`: one block per thing you want AWS to create.
- `user_data`: a script the instance runs once at first boot.

```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "http" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }
}

resource "aws_instance" "nginx" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.http.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/user_data.sh", {
    session_title = local.tags.Session
    session_group = "AWS Student Builder Group — Amity University Bengaluru"
    session_when  = "Sunday 16 August 2026, 15:30 IST"
  })
}
```

**⭐ Official learning material: [Terraform on AWS tutorials](https://developer.hashicorp.com/terraform/tutorials/aws-get-started) ⭐**

<!-- end_slide -->

Learn for free, and be paid to learn later
==========================================

All four are free to start (retrieved 2026-08-16).

- AWS Cloud Quest: role-play game for hands-on AWS practice ([Cloud Quest](https://aws.amazon.com/training/digital/aws-cloud-quest/))
- AWS Skill Builder: free digital courses and exam prep ([Skill Builder](https://skillbuilder.aws/))
- AWS Builder Center workshops: guided labs with community hosts ([workshops](https://builder.aws.com/build/workshops))
- Pulumi workshops: infrastructure as code in languages you know ([Pulumi](https://www.pulumi.com/resources/))

Builder Center in-person workshops run in sandbox accounts funded by the workshop host ([workshops](https://builder.aws.com/build/workshops)).

<!-- end_slide -->

How the AWS Free Tier actually works
====================================

The AWS Free Tier is the no-charge allowance a new account starts with.

- Credits: up to $200 at sign-up (retrieved 2026-08-16) ([Free Tier](https://aws.amazon.com/free/))
- Ends: after six months, or when credits run out (retrieved 2026-08-16) ([Billing guide](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/free-tier.html))
- Card: a credit card verifies identity only, no charge ([Billing guide](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/free-tier.html))

<!-- end_slide -->

Set a budget alert before you build
===================================

Do this before you create your first resource ([AWS Budgets](https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-create.html)).

1. Open Billing and Cost Management, then choose Budgets.
2. Create a budget and pick the cost budget type.
3. Set the period to monthly and the amount to $5.
4. Add an alert threshold at 80% of that amount.
5. Choose email as the notification channel.
6. Enter your own address, then create the budget.

<!-- end_slide -->

Tear down what you build, every time
====================================

Delete every billable resource in the same session you create it.

- Terraform: `terraform destroy` removes everything that configuration created.
- S3: empty the bucket, then delete it ([delete bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/delete-bucket.html))
- SQS: delete the queue you created ([delete queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/step-delete-queue.html))
- Check month-to-date charges in Billing and Cost Management ([Billing guide](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/))
- `t3.micro` in `ap-south-1`: $0.0112 per hour (retrieved 2026-08-16) ([EC2 prices](https://aws.amazon.com/ec2/pricing/on-demand/))

<!-- end_slide -->

If a charge surprises you
=========================

Work through these four steps in order.

1. Open the cost breakdown and find the charging service.
2. Stop or delete that resource straight away.
3. Recheck month-to-date charges after a few minutes.
4. Open a billing support case with AWS Support ([case management](https://docs.aws.amazon.com/awssupport/latest/user/case-management.html))

<!-- end_slide -->

Read: four things worth your time
=================================

Four sources, in the order I would read them.

- The Pragmatic Programmer: habits and craft that outlast any language ([Pragmatic Bookshelf](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/))
- Inside the IBM PC by Peter Norton: how a computer actually works ([archive.org record](https://archive.org/details/Peter_Norton_Inside_the_IBM_PC_Revised_and_Enlarged))
- AWS whitepapers: short official papers on services and patterns ([whitepapers](https://aws.amazon.com/whitepapers/))
- AWS Well-Architected Framework: six pillars for judging any design ([Well-Architected](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html))

<!-- end_slide -->

Watch: two re:Invent sessions
=============================

AWS re:Invent is the yearly AWS conference; the talks land on YouTube for free afterwards.

- 2023, Amazon S3 architecture deep dive: how S3 keeps files safe ([S3 deep dive](https://aws.amazon.com/awstv/watch/d33eda30e60/))
- 2019, Amazon's approach to failing successfully: learning from outages ([failing successfully](https://www.youtube.com/watch?v=yQiRli2ZPxU))

<!-- end_slide -->

Certification: one exam, then experience
========================================

Start with one exam, then let practice catch up.

- First exam: AWS Certified Solutions Architect – Associate ([exam page](https://aws.amazon.com/certification/certified-solutions-architect-associate/))
- AWS recommends at least 12 months of hands-on AWS experience ([exam guide](https://docs.aws.amazon.com/aws-certification/latest/solutions-architect-associate-03/solutions-architect-associate-03.html))
- Earn those 12 months of practice before your next exam.
- Practice always beats theory; the badge follows the work.

<!-- pause -->
<!-- column_layout: [2, 2] -->
<!-- column: 0 -->
![image:width:100%](../images/saa_1.jpg)
<!-- pause -->
<!-- column: 1 -->
![image:width:100%](../images/saa_2.jpg)

<!-- end_slide -->

Build in public
===============

Every finished project becomes four public artifacts.

- GitHub repository: the project code plus a runnable README ([GitHub docs](https://docs.github.com/en/repositories))
- LinkedIn post: a short note on what you built ([LinkedIn help](https://www.linkedin.com/help/linkedin))
- dev.to article: the tutorial behind that project ([dev.to editor guide](https://dev.to/p/editor_guide))
- AWS Builder Center article: the same story for AWS builders ([Builder Center](https://builder.aws.com/))
- Ship small and often; a public trail beats a private résumé.

<!-- end_slide -->

Follow, listen, meet, and tinker
================================

Four habits that keep you learning after this session.

- Follow Brooke Jamieson on Instagram for cloud and AI ([brooke.bytes](https://www.instagram.com/brooke.bytes/))
- Hear Akhil Navuluri's The Tech'o'Space Podcast on YouTube, Apple Podcasts, Spotify ([YouTube](https://www.youtube.com/@techspacepodcast), [Apple](https://podcasts.apple.com/us/podcast/the-tech-o-space-podcast/id1833251291), [Spotify](https://open.spotify.com/show/63CX0KazmN5WJzdcLtmDDk))
- Use AI tools to learn; never outsource your own thinking.
- Meet humans at local meetups; ask questions in the room.
- Turn a hobby into practice: scrape cricket scores, translate them.

<!-- end_slide -->

Homework 1: containerise and publish
====================================

Goal: containerise a page, publish its source.

1. Copy `homework/docker-hi-bengaluru/` into a repository.
2. `docker build -t hi-ben .`
3. `docker run -dp 8080:80 --name hi-ben hi-ben`
4. Push it to GitHub, publicly.

- Artifact: public repo with `Dockerfile`, image `hi-ben`.
- Works: `curl -s localhost:8080` returns the page.
- Teardown: `docker rm -f hi-ben`, `docker image rm hi-ben`.
- Then `docker ps -a`, `docker images` omit `hi-ben`.
- Docker Desktop, git, GitHub. 30 minutes. No AWS.

<!-- end_slide -->

Homework 2: one object, one message
===================================

Goal: store one object, pass one message.

1. `aws s3 mb s3://<BUCKET_NAME>`
2. `aws s3 cp hi.txt s3://<BUCKET_NAME>/`
3. `aws sqs create-queue --queue-name <QUEUE_NAME>`
4. Send one message, then receive it.
5. `aws s3 ls s3://<BUCKET_NAME>` lists it.
6. `aws s3 rm --recursive`, `aws s3 rb`, `aws sqs delete-queue`

- Artifact: object, printed body. 30 minutes.
- Gone: `aws s3api head-bucket`, `aws sqs get-queue-url` fail.
- AWS account, CLI. S3, SQS free (retrieved 2026-08-16) ([Free Tier](https://aws.amazon.com/free/))

```bash
aws sqs send-message \
  --queue-url <QUEUE_URL> \
  --message-body "hi from <YOUR_NAME>"

aws sqs receive-message \
  --queue-url <QUEUE_URL> \
  --max-number-of-messages 1
```

<!-- end_slide -->

This is just the beginning
==========================

<!-- column_layout: [2, 2] -->
<!-- column: 0 -->
![sunrise:width:100%](../images/beginning.jpeg)
<!-- pause -->
<!-- column: 1 -->
<!-- jump_to_middle -->
![padawan:width:100%](../images/baby-steps.jpg)

<!-- end_slide -->

Thank you and let's stay in touch
=========================

<!-- column_layout: [2, 2] -->
<!-- column: 0 -->
<!-- jump_to_middle -->
# LinkedIn: https://www.linkedin.com/in/rafal-krol/
## Instagram: https://www.instagram.com/devopsboss/
### YouTube: https://www.youtube.com/@DevOpsBoss

<!-- column: 1 -->
![Thank You:width:100%](../images/thank_you.jpeg)
