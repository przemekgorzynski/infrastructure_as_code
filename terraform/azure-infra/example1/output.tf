output "SSH_keys" { 
    value = tls_private_key.ssh_login_key.private_key_pem
}

output "Admin_user" {
    value = var.vm-username
}

output "Bastion_IP" {
    value = azurerm_linux_virtual_machine.bastion.public_ip_address
}

output "LB_IP" {
    value = azurerm_public_ip.pip-loadbalancer.ip_address
}

output "Admin_user_password" {
    value = var.username-password
}