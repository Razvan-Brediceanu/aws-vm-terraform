
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "existing" {
  ami           = "ami-08eb150f611ca277f"
  instance_type = var.instance_type

  subnet_id = "subnet-0c2c47f64dbfa1777"

  vpc_security_group_ids = [
    "sg-068417e610fa6ad1e"
  ]

  key_name = "RXB-KEY-PAIR"

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    delete_on_termination = false
  }
}

import {
  to = aws_instance.existing
  id = var.instance_id
}
