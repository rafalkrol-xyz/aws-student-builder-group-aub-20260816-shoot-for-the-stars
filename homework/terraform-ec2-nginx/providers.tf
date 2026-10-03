locals {
  tags = {
    Name      = var.name_prefix
    Project   = var.name_prefix
    Session   = "Cloud Foundations to Career Futures"
    ManagedBy = "terraform"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.tags
  }
}
