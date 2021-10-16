# Create a resource group
resource "azurerm_resource_group" "rg_prod" {
  name     = var.prod_rg_name
  location = var.azure_region
    tags = {
      Environment = "Production"
      Owner = "Przemek Gorzynski"
    }
}
resource "azurerm_resource_group" "rg_bastion" {
  name     = var.bastion_rg_name
  location = var.azure_region
    tags = {
      Environment = "Production"
      Owner = "Przemek Gorzynski"      
    }
}