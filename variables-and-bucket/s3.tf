resource "aws_s3_bucket" "this" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.commom_tags

}



resource "aws_s3_bucket" "import" {
  bucket = "test-terraform-import-2123"

  tags = local.commom_tags

}

resource "aws_s3_bucket_object" "this" {

  bucket = aws_s3_bucket.this.bucket

  key = "config/${local.ip_filepath}"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  tags = local.commom_tags

  content_type = "application/json"
}

resource "aws_s3_bucket_object" "random" {

  bucket = aws_s3_bucket.this.bucket

  key = "config/${random_pet.bucket.id}.json"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  tags = local.commom_tags

  content_type = "application/json"
}