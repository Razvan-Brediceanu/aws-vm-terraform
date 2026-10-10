output "instance_id" {
  description = "ID of the managed EC2 instance"
  value       = aws_instance.existing.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.existing.public_ip
}

output "private_ip" {
  description = "Private IP of the instance"
  value       = aws_instance.existing.private_ip
}