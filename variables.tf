
variable "aws_region" {
  description = "AWS region where the existing EC2 instance is located"
  type        = string
  default     = "eu-north-1"
}

variable "instance_id" {
  description = "ID of the existing EC2 instance to import"
  type        = string
  default     = "i-075e3b3d2c19c8f84"
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
