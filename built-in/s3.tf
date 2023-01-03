resource "random_pet" "bucket" {
  length = 5
}


resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.env}"
  tags = merge(local.common_tags, {
    "Test"       = "True"
    "Tags_merge" = "Ok"
  })
}


resource "aws_s3_object" "this" {

  bucket       = aws_s3_bucket.this.bucket
  key          = "${uuid()}.${local.file_ext}"
  source       = data.archive_file.json.output_path #Path do zip
  etag         = filemd5(data.archive_file.json.output_path)
  content_type = "application/zip"
}