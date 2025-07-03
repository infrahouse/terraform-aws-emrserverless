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

  # maximum_capacity {
  #   cpu    = var.application_max_cores
  #   memory = var.application_max_memory
  # }
  #
  # initial_capacity {
  #   initial_capacity_type = "Driver"
  #
  #   dynamic "initial_capacity_config" {
  #     for_each = var.initial_worker_count == null ? [] : [1]
  #
  #     content {
  #       worker_count = var.initial_worker_count
  #
  #       dynamic "worker_configuration" {
  #         for_each = [1] #?
  #
  #         content {
  #           cpu    = var.initial_worker_cpu
  #           memory = var.initial_worker_memory
  #         }
  #       }
  #     }
  #   }
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
