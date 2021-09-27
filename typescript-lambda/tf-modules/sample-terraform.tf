provider "aws" {
  region = var.aws_region
}

# https://registry.terraform.io/providers/integrations/github/latest/docs
provider "github" {
  # Make sure to have a GITHUB_TOKEN available as an env variable through tf secrets if using TF Cloud.
}

resource "random_string" "s3_bucket_suffix" {
  length = 10
}

module "sample_github_typescript_lambda" {
  source = "./github_ts_lambda"

  aws_region           = var.aws_region
  s3_bucket_name       = "my-sample-lambda-${random_string.s3_bucket_suffix}"
  github_repo          = "sample-templates"
  lambda_function_name = "sample-lambda"
}