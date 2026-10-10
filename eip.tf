# -----------------------------------------------------------------------------
# Elastic IP
#
# Gives the instance a fixed public address that survives stop/start.
#
# NOTE: AWS bills for Elastic IPs (and extra for ones left unattached), so
# run `terraform destroy` or delete this file when you're done experimenting.
# -----------------------------------------------------------------------------

resource "aws_eip" "vm" {
  domain = "vpc"

  tags = {
    Name = "aws-vm-terraform-eip"
  }
}

resource "aws_eip_association" "vm" {
  instance_id   = aws_instance.existing.id
  allocation_id = aws_eip.vm.id
}

output "elastic_ip" {
  description = "Elastic IP attached to the instance"
  value       = aws_eip.vm.public_ip
}