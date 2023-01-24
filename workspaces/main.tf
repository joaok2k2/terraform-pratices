terraform {
  
  backend "s3"{

    bucket = "terraform-course-tfstate-431591413306-2"
    key    = "workspace/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "tflock-terraform-course-tfstate-431591413306-2"
  }
}

provider "aws" {
  region = "us-west-2"
}


locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {

  count = lookup(var.instance, local.env)["number"]

  ami = lookup(var.instance, local.env)["ami"]

  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "instance-${local.env}-${count.index}"
    Env = local.env
    CreatedBy = "Terraform"
    
  }
  
}