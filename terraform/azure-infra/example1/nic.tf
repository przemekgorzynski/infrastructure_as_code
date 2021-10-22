resource "azurerm_network_interface" "nic-prod" {
  for_each  = toset(var.vms-prod)
  name      = each.value
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name

  ip_configuration {
    name                          = "${each.value}.${var.nic_sufix}"
    subnet_id                     = azurerm_subnet.subnet_prod.id
    private_ip_address_allocation = "Dynamic"
  }
}
  
resource "azurerm_network_interface" "nic-bastion" {
  name                = var.vms-bastion
  location            = azurerm_resource_group.rg_bastion.location
  resource_group_name = azurerm_resource_group.rg_bastion.name

  ip_configuration {
    name                          = "${var.vms-bastion}.${var.nic_sufix}"
    subnet_id                     = azurerm_subnet.subnet_bastion.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-bastion.id
  }
}