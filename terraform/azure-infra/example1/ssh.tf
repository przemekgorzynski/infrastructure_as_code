resource "tls_private_key" "ssh_login_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}