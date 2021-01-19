variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "PRIVATE_KEY_PATH" {
  default = "/home/przemek/.ssh/id_rsa"
}
variable "PUBLIC_KEY_PATH" {
  default = "/home/przemek/.ssh/id_rsa.pub"
}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AWS_INSTANCE_TYPE" {
    default = "t2.micro"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-north-1 = "ami-051961f216e8f3201"   # ubuntu 20.10
    eu-west-2 = "ami-05c424d59413a2876"    # ubuntu 20.10
  }
}