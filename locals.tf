locals {
  module_version = "0.2.0"

  default_module_tags = merge(
    {
      service : var.application_name
      created_by_module : "infrahouse/emrserverless/aws"
    }
  )
}
