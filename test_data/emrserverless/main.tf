module "test" {
  source              = "./../../"
  application_name    = local.application_name
  storage_bucket_name = aws_s3_bucket.storage.bucket
}
