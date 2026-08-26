# Homework 2: one object, one message

**Time:** 30 minutes · **AWS services:** Amazon S3, Amazon SQS · **Free Tier:** both services carry a free-tier
allowance, and this assignment stays far inside it ([AWS Free Tier](https://aws.amazon.com/free/), retrieved
2026-08-16)

## Goal

Store one object, pass one message.

You create an S3 bucket and upload one small file, create an SQS queue, send one message to that queue, receive the
same message back, then delete the object, the bucket and the queue.

## Prerequisites

- An AWS account ([create an AWS account](https://aws.amazon.com/resources/create-account/))
- The AWS CLI installed and configured with `aws configure`
  ([AWS CLI getting started](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html))

Both services have a free-tier allowance, so one object and one message cost nothing. Delete the bucket and the queue
in the same session anyway — that habit is the point of the exercise.

## Steps

1. **`aws s3 mb s3://<BUCKET_NAME>`** creates the bucket. Bucket names are globally unique across all AWS accounts, so
   pick something nobody else would use, for example `hi-ben-<YOUR_NAME>-<TODAYS_DATE>`.
2. **`aws s3 cp hi.txt s3://<BUCKET_NAME>/`** uploads one object. Create the file first with
   `echo "hi from <YOUR_NAME>" > hi.txt`.
3. **`aws sqs create-queue --queue-name <QUEUE_NAME>`** creates the queue. The command prints a `QueueUrl` — copy it,
   it is the `<QUEUE_URL>` every later command needs.
4. **Send one message, then receive it.** Both commands point at the same queue URL:

   ```bash
   aws sqs send-message \
     --queue-url <QUEUE_URL> \
     --message-body "hi from <YOUR_NAME>"

   aws sqs receive-message \
     --queue-url <QUEUE_URL> \
     --max-number-of-messages 1
   ```

5. **`aws s3 ls s3://<BUCKET_NAME>`** lists the object, so you can see it landed.
6. **Delete the object, the bucket and the queue.** The three commands are in the Teardown section below.

## Artifact

The object `hi.txt` sitting in your own S3 bucket, plus the message body printed back in your terminal by
`aws sqs receive-message`.

## Check it works

```bash
aws s3 ls s3://<BUCKET_NAME>
aws sqs receive-message --queue-url <QUEUE_URL> --wait-time-seconds 10
```

The first command lists `hi.txt` with its size and timestamp. The second prints a JSON block whose `Body` field holds
the text you sent. A message you already received stays hidden for the queue's visibility timeout, 30 seconds by
default, so if the receive prints nothing, wait half a minute and run it again.

## Teardown

```bash
aws s3 rm s3://<BUCKET_NAME> --recursive
aws s3 rb s3://<BUCKET_NAME>
aws sqs delete-queue --queue-url <QUEUE_URL>
```

The first command empties the bucket, the second removes the now-empty bucket, the third removes the queue. A bucket
that still holds objects cannot be deleted, which is why the order matters.

## Check teardown worked

```bash
aws s3api head-bucket --bucket <BUCKET_NAME>
aws sqs get-queue-url --queue-name <QUEUE_NAME>
```

Both commands fail, and that failure is the pass: `head-bucket` reports `404` `Not Found`, and `get-queue-url` reports
`AWS.SimpleQueueService.NonExistentQueue`. Queue deletion can take up to 60 seconds, so if the second command still
returns a URL, wait a minute and run it again. If either command succeeds after that, the resource is still there —
re-run the teardown.

## If something goes wrong

- `BucketAlreadyExists` on `aws s3 mb`: the name is taken by another account. Pick a different, more specific name.
- `Unable to locate credentials`: the AWS CLI has no credentials yet. Run `aws configure`, then confirm with
  `aws sts get-caller-identity`.
- `aws sqs receive-message` prints nothing: the queue is empty, or the message is inside its visibility timeout. Add
  `--wait-time-seconds 10` and retry, and confirm the send succeeded by re-reading its `MessageId` output.
- `AccessDenied`: the identity you configured lacks S3 or SQS permission. Check which identity you are using with
  `aws sts get-caller-identity`.
- `BucketNotEmpty` on `aws s3 rb`: run `aws s3 rm s3://<BUCKET_NAME> --recursive` first, then delete the bucket again.
- `QueueDeletedRecently` when you retry `create-queue` with the same name: SQS needs 60 seconds after a delete. Wait,
  or use a different queue name.
- You lost the queue URL: get it back with `aws sqs get-queue-url --queue-name <QUEUE_NAME>`.
