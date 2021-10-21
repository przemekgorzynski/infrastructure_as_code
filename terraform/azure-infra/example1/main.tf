terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.81.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = var.azure_subscription_id
  tenant_id         = var.azure_subscription_tenant_id
  client_id         = var.service_principal_appid
  client_secret     = var.service_principal_password
}