variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# https://registry.terraform.io/providers/integrations/github/latest/docs
variable "github_owner" {
  type = string
  default = null
  description = "Github Owner (Will use this in order to find the right github project"
}