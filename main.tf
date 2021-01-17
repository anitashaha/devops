terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-0be2609ba883822ec"
  instance_type = var.instance_type
  
}

variable "instance_type" {
  type = string
    
}