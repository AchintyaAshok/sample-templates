variable "lambda_handler_name" {
  type        = string
  description = "Name of lambda handler. In a project with multiple lambdas, this should map to the exported name of the lambda. For example: sampleLambdaHandler"
  default     = "sampleLambdaHandler"
}
variable "lambda_function_name" {
  type        = string
  description = "Name of the lambda function"
  default = "sample-lambda"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket that will host lambda's code"
}

variable "github_repo" {
  type        = string
  description = "Name of the github repo - needs to be under the GITHUB_ORGANIZATION that is defined as a variable, or env variable"
}

variable "aws_region" {
  type        = string
  description = "Region for s3 bucket holding the lambdas"
}
