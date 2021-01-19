provider "aws" {
  access_key = var.AWS_ACCESS_KEY                           #access key for IAM user
  secret_key = var.AWS_SECRET_KEY      #secret key for IAM user
  region     = var.AWS_REGION
}