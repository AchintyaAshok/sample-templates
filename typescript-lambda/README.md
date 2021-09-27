# Typescript Lambda
This module contains terraform code that will set up the following resources:

* AWS:
  * S3 Bucket - Used to host lambda code
  * Lambda Function - NodeJS14.x lambda function
  * AWS IAM Role - Basic IAM Role for Lambda Exceution with no additional permissions
  * IAM Group - CI_CD-{s3_bucket_name} - group created that will include a single IAM user that has entitlements to update function code and upload to S3 bucket.
  * IAM User - CI_CD_USER_FOR-{s3_bucket_name} - User used in gitlab workflow to upload code to S3 and update lambda
  * IAM Access Key - Secret key of CI_CD_USER_FOR-{s3_bucket_name} that will be uploaded as a github_actions_secret
  * IAM Policy - Policy for CI_CD user to be able to upload to S3 and update lambda function code
* GITHUB:
  * `github_actions_secret`: "AWS_S3_BUCKET" - Name of s3 bucket used to host lambda code
  * `github_actions_secret`: "AWS_REGION" - Region used in AWS  
  * `github_actions_secret`: "AWS_ACCESS_KEY_ID" - Access key for CI-CD user (access to s3, and update lambda code)
  * `github_actions_secret`: "AWS_SECRET_ACCESS_KEY" - Secret access key for CI-CD user (access to s3, and update lambda code)
  * `github_actions_secret`: "SAMPLE_LAMBDA_NAME" - Name of the lambda function to be updated

## Deployment
1. Get Github and AWS token and upload as a Terraform secret
2. Github project that will host lambdas will need to be created first, as terraform module will not create the project, but inject action_secrets into the github project.
3. Plan / Apply the terraform module to create the s3 bucket, lambda and dependencies. This will also link CI_CD user for Github Workflow to be able to update S3 and update lambda code.
4. Add github-workflow into `.github/workflows/main.yml` into root of the project to run github workflow that updates and deploys the lambda on every update to `main` branch.
5. Resources will need to be created first using terraform modules
   1. [Terraform Cloud](https://www.terraform.io/cloud) makes it very easy to use Terraform and manage state remotely.
6. Multiple lambdas can live in the same github project. The same bundle will be deployed to the multiple lambdas, but the handler can handle calling the different lambda entry points.
