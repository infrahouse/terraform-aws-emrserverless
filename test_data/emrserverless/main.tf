module "test" {
  source              = "./../../"
  application_name    = local.application_name
  storage_bucket_name = aws_s3_bucket.storage.bucket
  extra_policy_arns = {
    elasticmapreduce : aws_iam_policy.job_exec_role_permissions.arn
  }
}
