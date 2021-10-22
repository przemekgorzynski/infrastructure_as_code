resource "azurerm_linux_virtual_machine" "bastion" {
    name                  = var.vms-bastion
    location              = var.azure_region
    resource_group_name   = azurerm_resource_group.rg_bastion.name
    network_interface_ids = [azurerm_network_interface.nic-bastion.id]
    size                  = "Standard_B1ls"
    
    os_disk {
        name                 = "${var.vms-bastion}.${var.os_disk_sufix}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = var.vms-bastion
    admin_username = var.vm-username
    disable_password_authentication = true

    admin_ssh_key {
        username       = var.vm-username
        public_key     = tls_private_key.ssh_login_key.public_key_openssh
    }
}

resource "azurerm_linux_virtual_machine" "vms-prod" {
    for_each              = toset(var.vms-prod)
    name                  = each.value
    location              = var.azure_region
    resource_group_name   = azurerm_resource_group.rg_prod.name
    network_interface_ids = [azurerm_network_interface.nic-prod[each.key].id]
    size                  = "Standard_B1ls"
    
    os_disk {
        name                 = "${each.value}.${var.os_disk_sufix}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = each.value
    admin_username = var.vm-username
    admin_password = var.username-password
    disable_password_authentication = false
}