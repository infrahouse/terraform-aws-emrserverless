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
