terraform {
  backend "s3"{
    bucket = "terraform-course-tfstate-431591413306-2"
    key    = "ecs/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "tflock-terraform-course-tfstate-431591413306-2"
  }
}

provider "aws" {
  region = var.region
}

