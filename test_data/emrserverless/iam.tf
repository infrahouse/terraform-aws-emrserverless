# This policy is needed to let wordcount.py download dataset from the public bucket elasticmapreduce
data "aws_iam_policy_document" "job_exec_role_permissions" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::*.elasticmapreduce",
      "arn:aws:s3:::*.elasticmapreduce/*"
    ]
  }
}

resource "aws_iam_policy" "job_exec_role_permissions" {
  policy = data.aws_iam_policy_document.job_exec_role_permissions.json
}
