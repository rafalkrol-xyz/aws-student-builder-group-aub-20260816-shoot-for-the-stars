# The public SSM parameter always resolves to the current Amazon Linux 2023
# image in the configured Region, so no AMI ID is hardcoded here.
data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

locals {
  ami_id = nonsensitive(data.aws_ssm_parameter.al2023.value)
}

# The default VPC and its subnets already exist in every Region, so this
# module creates no VPC and no NAT gateway, and adds no hourly charge.
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Inbound TCP 80 only. There is deliberately no port 22 rule: the exercise
# needs no SSH, so no key ever has to be exposed.
resource "aws_security_group" "http" {
  name        = "${var.name_prefix}-http"
  description = "Allow inbound HTTP to the nginx instance and all egress"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP from the allowed CIDR range"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }

  egress {
    description = "All outbound traffic, so the instance can install nginx"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-http"
  }
}

resource "aws_instance" "nginx" {
  ami                         = local.ami_id
  instance_type               = var.instance_type
  subnet_id                   = sort(data.aws_subnets.default.ids)[0]
  vpc_security_group_ids      = [aws_security_group.http.id]
  associate_public_ip_address = true

  # IMDSv2 only.
  metadata_options {
    http_tokens = "required"
  }

  # delete_on_termination keeps `terraform destroy` from leaving an orphan
  # volume behind, which is the cost-safety-relevant setting here.
  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_gb
    delete_on_termination = true
    encrypted             = true
  }

  user_data = templatefile("${path.module}/user_data.sh", {
    session_title = local.tags.Session
    session_group = "AWS Student Builder Group — Amity University Bengaluru"
    session_when  = "Sunday 16 August 2026, 15:30 IST"
  })

  # Editing the script replaces the instance, so a re-apply is reproducible.
  user_data_replace_on_change = true

  tags = {
    Name = "${var.name_prefix}-nginx"
  }
}
