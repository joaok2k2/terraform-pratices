resource "ramdom_pet" "bucket" {
    length = 5
}


resource "aws_s3_bucket" "this"{
    bucket = "${ramdom_pet.bucket.id}-${var.env}"
    tags = local.commom_tags
}


resouce "aws_s3_bucket_object" "this"{

    bucket = aws_s3_bucket.this.bucket
    key = "${uuid()}.${local.file_ext}"
    source = data.archive_file.json.output_path
    etag = filemd5(data.archive_file.json.output_path)
    content-type = "application/zip"
}