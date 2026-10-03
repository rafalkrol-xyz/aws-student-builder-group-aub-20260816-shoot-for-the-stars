variable "aws_region" {
  description = "AWS Region the instance runs in. Mumbai is the closest Region to Bengaluru."
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance size. Smallest current-generation x86_64 size, matching the AMI."
  type        = string
  default     = "t3.micro"
}

variable "name_prefix" {
  description = "Prefix for resource names and tags, so the resources are easy to find."
  type        = string
  default     = "cloud-foundations"
}

variable "allowed_http_cidr" {
  description = "CIDR range allowed to reach TCP 80, so the page opens from any network."
  type        = string
  default     = "0.0.0.0/0"
}

variable "root_volume_gb" {
  description = "Size of the encrypted gp3 root volume in gibibytes."
  type        = number
  default     = 8
}
