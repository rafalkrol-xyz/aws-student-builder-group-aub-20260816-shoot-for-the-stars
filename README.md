# Shoot for the Stars

## Overview

My presentation and supporting material for the [AWS Student Builder Group](https://builder.aws.com/community/student-builder-groups)
AUB's ([Amity University Bengaluru](https://www.meetup.com/aws-sbg-at-amity-university-bengaluru/)) Cloud Foundations to Career Futures series.

![Rafal Krol at AUB](./images/shoot-for-the-stars.webp)

## Homework

Three assignments, in order. Each one is self-contained and ends with a teardown step.

+ [01 — containerise and publish](./homework/01-containerise-and-publish.md)
  + **Time:** 30 minutes
  + **AWS services:** none, everything runs on your own machine
+ [02 — one object, one message](./homework/02-s3-object-sqs-message.md)
  + **Time:** 30 minutes
  + **AWS services:** Amazon S3, Amazon SQS
+ [03 — one server, one web page, in code](./homework/03-terraform-ec2-nginx.md)
  + **Time:** 45 minutes
  + **AWS services:** Amazon EC2, plus Amazon VPC's default VPC

**NB**, Homework 1 and 2 create no billable AWS resources: homework 1 needs no AWS account at all, and homework 2 stays inside
the S3 and SQS free-tier allowances. **Homework 3 does create a billable resource**, a `t3.micro` EC2 instance charged per
running hour, so set a budget alert first and run `terraform destroy` as soon as you're done.
