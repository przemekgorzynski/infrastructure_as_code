# VNET
resource "azurerm_virtual_network" "vnet_prod" {
  name                = var.prod_vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg_prod.name
}

resource "azurerm_virtual_network" "vnet_bastion" {
  name                = var.bastion_vnet_name
  address_space       = ["10.100.0.0/16"]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg_bastion.name
}

# SUBNET
resource "azurerm_subnet" "subnet_prod" {
  name                 = "${azurerm_virtual_network.vnet_prod.name}_subnet"
  resource_group_name  = azurerm_resource_group.rg_prod.name
  virtual_network_name = azurerm_virtual_network.vnet_prod.name
  address_prefixes     = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "subnet_bastion" {
  name                 = "${azurerm_virtual_network.vnet_bastion.name}_subnet"
  resource_group_name  = azurerm_resource_group.rg_bastion.name
  virtual_network_name = azurerm_virtual_network.vnet_bastion.name
  address_prefixes     = ["10.100.0.0/24"]
}