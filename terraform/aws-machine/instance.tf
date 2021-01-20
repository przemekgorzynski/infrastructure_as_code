resource "aws_key_pair" "przemek"{
  key_name = "przemek"
  public_key = file(var.PUBLIC_KEY_PATH)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]       # find ami based on region  from vars.tf file
  instance_type = var.AWS_INSTANCE_TYPE[var.AWS_REGION]    #deploy instance type depends on location
  key_name = aws_key_pair.przemek.key_name

  provisioner "local-exec" {
    command = " echo ${aws_instance.example.public_ip} ${aws_instance.example.id} >> aws_inventory_ips.txt"
  }

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

output "Public_ip" {
  value = aws_instance.example.public_ip
}

output "Private_ip" {
  value = aws_instance.example.private_ip
}