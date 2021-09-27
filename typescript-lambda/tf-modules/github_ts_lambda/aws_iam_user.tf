resource "aws_iam_group" "CICD_S3_deployment_group" {
  name = "CI_CD-${var.s3_bucket_name}"
}

resource "aws_iam_group_policy" "CICD_POLICY" {
  group  = aws_iam_group.CICD_S3_deployment_group.name
  policy = data.aws_iam_policy_document.cicd_s3_policy.json
}

resource "aws_iam_user" "CICD_USER" {
  name = "CI_CD_USER_FOR-${var.s3_bucket_name}"
}

resource "aws_iam_access_key" "CICD_USER_KEY" {
  user = aws_iam_user.CICD_USER.name
}

resource "aws_iam_user_group_membership" "aws_iam_user_group_membership" {
  groups = [aws_iam_group.CICD_S3_deployment_group.name]
  user   = aws_iam_user.CICD_USER.name
}

data "aws_iam_policy_document" "cicd_s3_policy" {
  policy_id = "CICD S3 Policy"

  statement {
    actions = [
      "s3:PutBucketCORS",
      "s3:PutObject",
      "s3:GetObject",
      "s3:RestoreObject",
      "s3:ListBucket",
      "s3:AbortMultipartUpload",
      "s3:PutBucketTagging",
      "s3:GetBucketRequestPayment",
      "s3:DeleteBucketOwnershipControls",
      "s3:GetObjectTagging",
      "s3:GetMetricsConfiguration",
      "s3:GetBucketOwnershipControls",
      "s3:GetBucketAcl",
      "s3:GetBucketCORS",
      "s3:GetObjectVersion"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/*",
      "arn:aws:s3:::${var.s3_bucket_name}"
    ]
  }

  statement {
    actions = [
      "s3:ListAllMyBuckets",
      "s3:ListAccessPoints"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "lambda:UpdateFunctionCode"
    ]
    resources = [aws_lambda_function.sample_lambda.arn]
  }
}