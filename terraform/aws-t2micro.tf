provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-071884cefc7e770ba"
  instance_type = "t2.micro"
}