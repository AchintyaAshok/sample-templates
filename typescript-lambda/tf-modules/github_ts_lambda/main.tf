resource "aws_lambda_function" "sample_lambda" {
  function_name = var.lambda_function_name
  description   = "Sample tf lambda created by terraform module"
  role          = aws_iam_role.this.arn
  handler       = "index.${var.lambda_handler_name}"
  runtime       = "nodejs14.x"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = "build.zip"
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_iam_role_policy_attachment" "basic_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name               = "basic_iam_role_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_role_policy.json
}

data "aws_iam_policy_document" "lambda_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}