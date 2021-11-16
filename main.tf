terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0ec23856b3bad62d3"
  instance_type          = "t2.micro"
  key_name               = "ssh-key"
  vpc_security_group_ids = ["sg-0a7190b16de17a688"]
  subnet_id              = "subnet-06c9dc5b6b9981011"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
