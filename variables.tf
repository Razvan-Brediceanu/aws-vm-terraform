variable "aws_region" {
  description = "AWS region where the existing EC2 instance is located"
  type        = string
  default     = "eu-north-1"
}

variable "instance_id" {
  description = "ID of the existing EC2 instance to import"
  type        = string

  validation {
    condition     = can(regex("^i-[0-9a-f]+$", var.instance_id))
    error_message = "Must be a valid EC2 instance ID (e.g. i-0123456789abcdef0)."
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "MaybeThisTime"
}

variable "subnet_id" {
  description = "Subnet the existing instance lives in"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the existing instance"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the EC2 key pair attached to the instance"
  type        = string
}