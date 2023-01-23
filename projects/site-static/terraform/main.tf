terraform {

  backend "s3" {}
}

provider "aws" {
  region = var.region
}


resource "random_pet" "website" {
  length = 5
}