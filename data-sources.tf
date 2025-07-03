data "aws_s3_bucket" "storage" {
  bucket = var.storage_bucket_name
}
