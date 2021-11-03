output "Admin_user" {
    value = var.vm-username
}

output "Bastion_IP" {
    value = azurerm_linux_virtual_machine.bastion.public_ip_address
}

output "LB_IP" {
    value = azurerm_public_ip.pip-loadbalancer.ip_address
}

output "FQDN" {
    value = azurerm_public_ip.pip-loadbalancer.fqdn
}

output "Admin_user_password" {
    value = var.username-password
}