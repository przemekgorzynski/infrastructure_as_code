# VNET
resource "azurerm_virtual_network" "vnet_prod" {
  name                = var.prod_vnet_name
  address_space       = [var.vnet_address_spaces[var.prod_vnet_name]]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg_prod.name
}

resource "azurerm_virtual_network" "vnet_bastion" {
  name                = var.bastion_vnet_name
  address_space       = [var.vnet_address_spaces[var.bastion_vnet_name]]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg_bastion.name
}

# SUBNET
resource "azurerm_subnet" "subnet_prod" {
  name                 = var.prod_subnet_name
  resource_group_name  = azurerm_resource_group.rg_prod.name
  virtual_network_name = azurerm_virtual_network.vnet_prod.name
  address_prefixes     = [var.subnet_address_spaces[var.prod_subnet_name]]
}
resource "azurerm_subnet" "subnet_bastion" {
  name                 = var.bastion_subnet_name
  resource_group_name  = azurerm_resource_group.rg_bastion.name
  virtual_network_name = azurerm_virtual_network.vnet_bastion.name
  address_prefixes     = [var.subnet_address_spaces[var.bastion_subnet_name]]
}

## Peering
resource "azurerm_virtual_network_peering" "vnet_prod-2-vnet_bastion" {
  name                      = "${azurerm_virtual_network.vnet_prod.name}-2-${azurerm_virtual_network.vnet_bastion.name}"
  resource_group_name       = azurerm_resource_group.rg_prod.name
  virtual_network_name      = azurerm_virtual_network.vnet_prod.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_bastion.id
}
resource "azurerm_virtual_network_peering" "vnet_bastion-2-vnet_prod" {
  name                      = "${azurerm_virtual_network.vnet_bastion.name}-2-${azurerm_virtual_network.vnet_prod.name}"
  resource_group_name       = azurerm_resource_group.rg_bastion.name
  virtual_network_name      = azurerm_virtual_network.vnet_bastion.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_prod.id
}

# Public IP for bastion
resource "azurerm_public_ip" "pip-bastion" {
  name                = var.pip-bastion-name
  resource_group_name = azurerm_resource_group.rg_bastion.name
  location            = azurerm_resource_group.rg_bastion.location
  allocation_method   = "Dynamic"
  idle_timeout_in_minutes = 10
}