#!/bin/bash
# Rendered by templatefile in main.tf and run once at first boot.
set -euo pipefail

dnf install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<'PAGE'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>${session_title}</title>
  </head>
  <body>
    <h1>${session_title}</h1>
    <p>${session_group}</p>
    <p>Online session, ${session_when}</p>
    <p>This page is served by nginx on an Amazon EC2 instance created with
      Terraform. Run <code>terraform destroy</code> when you are done.</p>
  </body>
</html>
PAGE

systemctl reload nginx
