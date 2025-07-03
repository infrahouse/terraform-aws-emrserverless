output "storage_bucket_name" {
  value = module.test.storage_bucket_name
}

output "storage_bucket_arn" {
  value = module.test.storage_bucket_arn
}

output "application_id" {
  value = module.test.application_id
}

output "job_role_name" {
  value = module.test.job_role_name
}

output "job_role_arn" {
  value = module.test.job_role_arn
}

output "output_path" {
  value = aws_s3_object.output_prefix.key
}
