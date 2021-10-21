resource "azurerm_network_interface" "nic-vm01-prod" {
  name                = "nic-vm01-prod"
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name

  ip_configuration {
    name                          = "vm01-prod-internal"
    subnet_id                     = azurerm_subnet.subnet_prod.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic-vm01-prod
  }
}

resource "azurerm_network_interface" "nic-vm02-prod" {
  name                = "nic-vm02-prod"
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name

  ip_configuration {
    name                          = "vm02-prod-internal"
    subnet_id                     = azurerm_subnet.subnet_prod.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic-vm02-prod
  }
}

resource "azurerm_network_interface" "nic-vm01-bastion" {
  name                = "nic-vm01-bastion"
  location            = azurerm_resource_group.rg_bastion.location
  resource_group_name = azurerm_resource_group.rg_bastion.name

  ip_configuration {
    name                          = "vm01-bastion-internal"
    subnet_id                     = azurerm_subnet.subnet_bastion.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.nic-vm01-bastion
  }
}