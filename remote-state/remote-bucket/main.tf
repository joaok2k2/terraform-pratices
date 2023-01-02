provider "aws" {
  region = "us-west-2"
}


data "aws_caller_identity" "current" {}


resource "aws_s3_bucket" "remote-state" {
  bucket = "terraform-course-tfstate-${data.aws_caller_identity.current.account_id}"
  tags = {
    Name        = "My bucket"
    Description = "Stores terraform remote state files"
    Environment = "Dev"
    Managedby   = "terraform"
    Owner       = "João"
    UpdatedAt   = "2023-01-02"
  }
}

resource "aws_s3_bucket_versioning" "versionamento" {
  bucket = aws_s3_bucket.remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}
output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}

