variable "application_name" {
  description = "Name of application"
  type        = string
}

variable "storage_bucket_name" {
  description = "Name of storage bucket"
  type        = string
}

variable "extra_policy_arns" {
  description = "Map of IAM policy ARNs to attach to the job execution role"
  type        = map(string)
  default     = {}
}

variable "enable_scheduler_configuration" {
  description = "Enable scheduler configuration (supported in AWS provider 6.x+)"
  type        = bool
  default     = true
}

variable "max_concurrent_runs" {
  description = "Maximum number of concurrent runs (scheduler_configuration - AWS provider 6.x+)"
  type        = number
  default     = 15
}

variable "queue_timeout_minutes" {
  description = "Queue timeout in minutes (scheduler_configuration - AWS provider 6.x+)"
  type        = number
  default     = 360
}
