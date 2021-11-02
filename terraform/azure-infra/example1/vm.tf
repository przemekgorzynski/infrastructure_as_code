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
        publisher = var.os-publisher
        offer     = var.os-offer
        sku       = var.os-sku
        version   = var.os-version
    }

    computer_name  = var.vms-bastion
    admin_username = var.vm-username
    disable_password_authentication = true

    admin_ssh_key {
        username       = var.vm-username
        public_key     = tls_private_key.ssh_login_key.public_key_openssh
    }

    depends_on = [
      azurerm_linux_virtual_machine.vms-prod,
      tls_private_key.ssh_login_key
    ]

    provisioner "remote-exec" {
       inline = [
           "sudo apt update",
           "sudo apt upgrade -y",
           "sudo apt install sshpass",
           "sshpass -p \"YourPassword1\" ssh -o \"StrictHostKeyChecking=no\" admuser@10.160.0.4 \"sudo apt update && sudo apt upgrade -y && sudo apt install -y apache2 && echo \"Hosted on VM01-prod\" | sudo tee /var/www/html/index.html && sudo systemctl restart apache2\"",
           "sshpass -p \"YourPassword1\" ssh -o \"StrictHostKeyChecking=no\" admuser@10.160.0.5 \"sudo apt update && sudo apt upgrade -y && sudo apt install -y apache2 && echo \"Hosted on VM02-prod\" | sudo tee /var/www/html/index.html && sudo systemctl restart apache2\"",
       ]
       connection {
           type        = "ssh"
           port        = "22"
           agent       = false
           host        = self.public_ip_address
           user        = var.vm-username
           private_key = tls_private_key.ssh_login_key.private_key_pem
       }
    }
}

resource "azurerm_linux_virtual_machine" "vms-prod" {
    for_each              = toset(var.vms-prod)
    name                  = each.value
    location              = var.azure_region
    resource_group_name   = azurerm_resource_group.rg_prod.name
    network_interface_ids = [azurerm_network_interface.nic-prod[each.key].id]
    availability_set_id   = azurerm_availability_set.availibility_set_prod.id
    size                  = "Standard_B1ls"
    
    os_disk {
        name                 = "${each.value}.${var.os_disk_sufix}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = var.os-publisher
        offer     = var.os-offer
        sku       = var.os-sku
        version   = var.os-version
    }

    computer_name  = each.value
    admin_username = var.vm-username
    admin_password = var.username-password
    disable_password_authentication = false
}

