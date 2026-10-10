terraform {
  required_version = ">= 1.5"

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

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

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