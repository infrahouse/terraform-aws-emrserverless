data "aws_iam_policy_document" "job_role_trust" {
  statement {
    principals {
      identifiers = [
        "emr-serverless.amazonaws.com"
      ]
      type = "Service"
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

data "aws_iam_policy_document" "job_permissions" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:DeleteObject"
    ]
    resources = [
      data.aws_s3_bucket.storage.arn,
      "${data.aws_s3_bucket.storage.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "job_permissions" {
  policy = data.aws_iam_policy_document.job_permissions.json
}

resource "aws_iam_role" "job_role" {
  assume_role_policy = data.aws_iam_policy_document.job_role_trust.json
}

resource "aws_iam_role_policy_attachment" "job_role" {
  policy_arn = aws_iam_policy.job_permissions.arn
  role       = aws_iam_role.job_role.name
}
