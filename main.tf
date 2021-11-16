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
  ami           = "ami-0ec23856b3bad62d3"
  instance_type = "t2.micro"
  key_name      = "ssh-key"
  vpc_security_group_ids = ["sg-0a7190b16de17a688"]
  subnet_id              = "subnet-06c9dc5b6b9981011"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

