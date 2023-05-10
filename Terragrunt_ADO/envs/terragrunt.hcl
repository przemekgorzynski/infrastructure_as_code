locals {
    env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals
}

remote_state {
    backend = "azurerm"
    config = {
        subscription_id         = local.env_vars.subscription_id
        resource_group_name     = "rg-usecase-dev-storage"
        storage_account_name    = "usecasestoragedev"
        container_name          = "poc-terragrunt-${local.env_vars.stage}"
        key                     = "terraform.tfstate"   
    }
}

inputs = {
    location_short  = local.env_vars.location_short
    location        = local.env_vars.location
    project         = local.env_vars.project
    stage           = local.env_vars.stage
    context         = local.env_vars.context
    instance        = local.env_vars.instance
}