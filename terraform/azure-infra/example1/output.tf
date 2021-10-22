output "ssh_keys" { 
    value = tls_private_key.ssh_login_key.private_key_pem
}

output "Admin_user" {
    value = var.vm-username
}

output "Bastion_IP" {
    value = azurerm_linux_virtual_machine.bastion.public_ip_address
}