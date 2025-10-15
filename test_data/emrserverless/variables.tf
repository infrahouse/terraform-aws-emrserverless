variable "region" {}
variable "role_arn" {
  default = null
}
variable "enable_scheduler_configuration" {
  description = "Enable scheduler configuration (supported in AWS provider 6.x+)"
  type        = bool
  default     = true
}
