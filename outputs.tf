output "storage_bucket_name" {
  value = data.aws_s3_bucket.storage.bucket
}

output "storage_bucket_arn" {
  value = data.aws_s3_bucket.storage.arn
}

output "application_id" {
  value = aws_emrserverless_application.emr_application.id
}

output "job_role_name" {
  value = aws_iam_role.job_role.name
}

output "job_role_arn" {
  value = aws_iam_role.job_role.arn
}
