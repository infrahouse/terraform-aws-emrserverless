resource "aws_emrserverless_application" "emr_application" {
  name          = var.application_name
  release_label = "emr-7.9.0"
  type          = "spark"
  tags = merge(
    {
      module_version : local.module_version
    },
    local.default_module_tags,
  )

  dynamic "scheduler_configuration" {
    for_each = var.enable_scheduler_configuration ? [1] : []

    content {
      max_concurrent_runs   = var.max_concurrent_runs
      queue_timeout_minutes = var.queue_timeout_minutes
    }
  }

}


# resource "aws_emr_studio" "studio-1" {
#   name                      = "studio-1"
#   auth_mode                 = "IAM"
#   # vpc_id                    = aws_vpc.main.id
#   # subnet_ids                = [aws_subnet.private1.id, aws_subnet.private2.id]
#   # service_role              = aws_iam_role.emr_studio_service.arn
#   # workspace_security_group_id = aws_security_group.emr_studio_workspace.id
#   # engine_security_group_id    = aws_security_group.emr_studio_engine.id
#   # default_s3_location         = "s3://my-studio-logs/"
#   default_s3_location       = ""
#   engine_security_group_id  = ""
#   service_role              = ""
#   subnet_ids = []
#   vpc_id                    = ""
#   workspace_security_group_id = ""
# }
