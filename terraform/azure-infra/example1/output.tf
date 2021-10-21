output "vm01-prod-IP" {
    value = azurerm_network_interface.nic-vm01-prod.private_ip_address
}

output "vm02-prod-IP" {
    value = azurerm_network_interface.nic-vm02-prod.private_ip_address
}

output "vm01-bastion-IP" {
    value = azurerm_network_interface.nic-vm01-bastion.private_ip_address
} 