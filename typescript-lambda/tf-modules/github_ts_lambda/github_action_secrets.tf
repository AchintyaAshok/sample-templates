resource "github_actions_secret" "AWS_S3_BUCKET" {
  repository       = var.github_repo
  secret_name      = "AWS_S3_BUCKET"
  plaintext_value  = var.s3_bucket_name
}

resource "github_actions_secret" "AWS_REGION" {
  repository       = var.github_repo
  secret_name      = "AWS_REGION"
  plaintext_value  = var.aws_region
}

resource "github_actions_secret" "AWS_ACCESS_KEY_ID" {
  repository       = var.github_repo
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = aws_iam_access_key.CICD_USER_KEY.id
}

resource "github_actions_secret" "AWS_SECRET_ACCESS_KEY" {
  repository       = var.github_repo
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = aws_iam_access_key.CICD_USER_KEY.secret
}

resource "github_actions_secret" "SAMPLE_LAMBDA_NAME" {
  repository      = var.github_repo
  secret_name     = "SAMPLE_LAMBDA_NAME"
  plaintext_value = aws_lambda_function.sample_lambda.function_name
}
