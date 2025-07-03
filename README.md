# terraform-aws-emrserverless


## Usage

```hcl
module "test" {
  source  = "infrahouse/emrserverless/aws"
  version = "0.2.0"

  application_name    = local.application_name
  storage_bucket_name = aws_s3_bucket.storage.bucket
  extra_policy_arns = {
    elasticmapreduce : aws_iam_policy.job_exec_role_permissions.arn
  }
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.62 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_emrserverless_application.emr_application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emrserverless_application) | resource |
| [aws_iam_policy.job_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.job_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.extra](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.job_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.job_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.job_role_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.storage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of application | `string` | n/a | yes |
| <a name="input_extra_policy_arns"></a> [extra\_policy\_arns](#input\_extra\_policy\_arns) | Map of IAM policy ARNs to attach to the job execution role | `map(string)` | `{}` | no |
| <a name="input_storage_bucket_name"></a> [storage\_bucket\_name](#input\_storage\_bucket\_name) | Name of storage bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | n/a |
| <a name="output_job_role_arn"></a> [job\_role\_arn](#output\_job\_role\_arn) | n/a |
| <a name="output_job_role_name"></a> [job\_role\_name](#output\_job\_role\_name) | n/a |
| <a name="output_storage_bucket_arn"></a> [storage\_bucket\_arn](#output\_storage\_bucket\_arn) | n/a |
| <a name="output_storage_bucket_name"></a> [storage\_bucket\_name](#output\_storage\_bucket\_name) | n/a |
