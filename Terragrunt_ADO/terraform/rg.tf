terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    key_vault {
      #we enable purge protection, therefor we disable purge on secret deletion here
      purge_soft_delete_on_destroy               = true
      recover_soft_deleted_key_vaults            = true
      purge_soft_deleted_certificates_on_destroy = true
      purge_soft_deleted_keys_on_destroy         = true
      purge_soft_deleted_secrets_on_destroy      = true
      purge_soft_deleted_hardware_security_modules_on_destroy = true
      recover_soft_deleted_certificates          = true
      recover_soft_deleted_secrets               = true
      recover_soft_deleted_keys                  = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  skip_provider_registration = true
}

module "MyAzResourceGroup" {
  source   = "XXX"
  project  = var.project
  stage    = var.stage
  context  = var.context
  instance = var.instance
  location = var.location
}