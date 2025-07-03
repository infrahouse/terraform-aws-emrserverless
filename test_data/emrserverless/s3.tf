resource "aws_s3_bucket" "storage" {
  bucket_prefix = "${local.application_name}-storage-"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.storage.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_policy" "storage" {
  bucket = aws_s3_bucket.storage.id
  policy = data.aws_iam_policy_document.storage.json
}


data "aws_iam_policy_document" "storage" {
  statement {
    sid    = "AllowSSLRequestsOnly"
    effect = "Deny"

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.storage.arn,
      "${aws_s3_bucket.storage.arn}/*",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values = [
        "false"
      ]
    }
  }

}


resource "aws_s3_object" "wordcount" {
  bucket = aws_s3_bucket.storage.bucket
  key    = "/scripts/wordcount.py"
  source = "${path.module}/files/wordcount.py"
}

resource "aws_s3_object" "output_prefix" {
  bucket  = aws_s3_bucket.storage.bucket
  key     = "emr-serverless-spark/output/" # ← this creates the folder
  content = ""
}

resource "aws_s3_object" "logs_prefix" {
  bucket  = aws_s3_bucket.storage.bucket
  key     = "emr-serverless-spark/logs/" # ← this creates the folder
  content = ""
}
