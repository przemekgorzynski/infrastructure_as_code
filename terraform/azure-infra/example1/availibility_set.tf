resource "azurerm_availability_set" "availibility_set_prod" {
  name                = var.prod_availibility_set
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name
  platform_update_domain_count = var.update_domain
  platform_fault_domain_count = var.fault_domain

  tags = {
      Environment = "Production"
      Owner = "Przemek Gorzynski"
  }
}