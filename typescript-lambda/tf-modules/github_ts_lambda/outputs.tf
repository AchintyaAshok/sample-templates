output "lambda_role" {
  value = aws_iam_role.this.name
}

output "sample_lambda_arn" {
  value = aws_lambda_function.sample_lambda.arn
}