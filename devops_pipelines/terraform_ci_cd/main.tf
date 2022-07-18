terraform {
    backend "azurerm" {
      resource_group_name  = "tfstates"
      storage_account_name = "account4tfstates"
      container_name       = "tfstate"
      key                  = "prod.terraform.tfstate"
    }
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.2.0"
      }
    }
}

provider "azurerm" {
  features {}
}