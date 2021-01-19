resource "aws_key_pair" "mine"{
  key_name = "mine"
  public_key = file(var.PUBLIC_KEY_PATH)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]       # find ami based on region  from vars.tf file
  instance_type = var.AWS_INSTANCE_TYPE
  key_name = aws_key_pair.mine.key_name

   provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh"
    ]
  }

  connection {
    host = coalesce(self.public_ip, self.private_ip)
    type = "ssh"
    user = var.INSTANCE_USERNAME
    private_key = file(var.PRIVATE_KEY_PATH) 
  }
}