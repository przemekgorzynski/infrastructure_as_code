provider "aws" {
  access_key = ""                           #access key for IAM user
  secret_key = ""       #secret key for IAM user
  region     = "eu-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-05c424d59413a2876"                       #AMI ID (Amazon machine images)
  instance_type = "t2.micro"
}