# Authorization
# Generate with: az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
variable "service_principal_appid" { 
    default =  "9ece746c-4dda-4cd6-9ee4-6b13e5419807"
}

variable "azure_subscription_tenant_id" {
     default =  "5cca91d2-0a66-4def-a9c8-72db71d944fb"
}
variable "azure_subscription_id" {
     default =  "3ea3023e-c5e7-44a5-8c4f-19b3bec14e21"
}

variable "service_principal_password" {
     default =  "XXX"
}

# General
variable "azure_region" { 
    default = "West Europe"
}

# Resource group
variable "prod_rg_name" {
    default = "prod_resource_group"
}
variable "bastion_rg_name" {
    default = "bastion_resource_group"
}

# VNET
variable "prod_vnet_name" {
    default = "vnet_prod"
}
variable "bastion_vnet_name" {
    default = "vnet_bastion"
}