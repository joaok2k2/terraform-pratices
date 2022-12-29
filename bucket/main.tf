provider "aws" {
  region = "us-west-2"
}



resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-terraform-course-bsp-2"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "terraform"
    Owner       = "João"
    UpdatedAt   = "2022-12-26"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "private"
}