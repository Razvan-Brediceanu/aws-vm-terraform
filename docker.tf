# -----------------------------------------------------------------------------
# Docker
#
# Startup script that installs Docker when the instance boots.
# To use it, add this to the aws_instance block in main.tf:
#
#   user_data = local.docker_user_data
#
# Note: user_data only runs on first boot, so it won't install Docker on an
# instance that's already running. Kept here as a reference.
# -----------------------------------------------------------------------------

locals {
  docker_user_data = <<-EOT
    #!/bin/bash
    set -e
    curl -fsSL https://get.docker.com | sh
    usermod -aG docker ubuntu
    systemctl enable --now docker
  EOT
}