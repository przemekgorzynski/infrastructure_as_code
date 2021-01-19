resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]       # find ami based on region  from vars.tf file
  instance_type = var.AWS_INSTANCE_TYPE
}