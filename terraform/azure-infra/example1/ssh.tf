resource "tls_private_key" "ssh_login_key" {
  algorithm = "RSA"
  rsa_bits = 4096

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_login_key.private_key_pem}' > id_rsa"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_login_key.public_key_openssh}' > id_rsa.pub"
  }

  provisioner "local-exec" {
    command = "chmod 600 id_rsa"
  }
}