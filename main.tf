terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.23"
    }
  }
}

provider "aws" {
  profile = "user1"
  region  = "us-east-1"
}

resource "aws_security_group" "tf_ssh" {
  name   = "tf_ssh"
  vpc_id = "vpc-7fdb0302"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami             = "ami-0be2609ba883822ec"
  instance_type   = var.instance_type
  key_name        = "dev2020"
  vpc_security_group_ids = [aws_security_group.tf_ssh.id]
}

resource "aws_s3_bucket" "testbucket" {
  bucket = "anis3test123"

}

output "publicip" {
  value = aws_instance.example.public_ip
}

output "public_dns_name" {
  value = aws_instance.example.public_dns
}

variable "instance_type" {
  type = string

}