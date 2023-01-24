terraform {

  backend "s3" {}
}

provider "aws" {
  region = var.region
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

resource "random_pet" "website" {
  length = 5
}