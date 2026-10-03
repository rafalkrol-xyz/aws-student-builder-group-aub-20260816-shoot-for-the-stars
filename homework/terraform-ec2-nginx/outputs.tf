output "instance_id" {
  description = "ID of the EC2 instance, for looking it up in the console or the CLI."
  value       = aws_instance.nginx.id
}

output "public_ip" {
  description = "Public IPv4 address of the instance."
  value       = aws_instance.nginx.public_ip
}

output "public_dns" {
  description = "Public DNS name of the instance."
  value       = aws_instance.nginx.public_dns
}

# The homework asks the student to open the page in a browser, so the module
# hands back a ready-to-paste URL rather than a bare address. It is http, not
# https: nginx serves plain HTTP here and the security group opens TCP 80 only.
output "page_url" {
  description = "URL of the nginx page. Paste this into a browser to check the exercise works."
  value       = "http://${aws_instance.nginx.public_ip}/"
}
