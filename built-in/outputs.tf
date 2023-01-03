output "random_pet" {
    value = random_pet.bucket.id
}
output "s3_bucket_name" {
    value = aws_s3_bucket.this.bucket
}
output "s3_bucket_arn" {
    value = aws_s3_bucket.this.arn
}
