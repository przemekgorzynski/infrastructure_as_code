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
    default = "resource_group_prod"
}
variable "bastion_rg_name" {
    default = "resource_group_bastion"
}

# VNET
variable "prod_vnet_name" {
    default = "vnet_prod"
}
variable "bastion_vnet_name" {
    default = "vnet_bastion"
}

variable "prod_subnet_name" {
    default = "vnet_prod_subnet"
}
variable "bastion_subnet_name" {
    default = "vnet_bastion_subnet"
}

variable "vnet_address_spaces" {
  type = map(string)
  default = {
    vnet_prod = "10.0.0.0/16"
    vnet_bastion = "10.100.0.0/16"
  }
}

variable "subnet_address_spaces" {
  type = map(string)
  default = {
    vnet_prod_subnet = "10.0.0.0/24"
    vnet_bastion_subnet = "10.100.0.0/24"
  }
}

variable "pip-bastion-name" {    # Public IP name for bsation host
    default = "bastion-pip"
}

# NIC
variable "nic-vm01-prod" {
    default = "10.0.0.4"
}
variable "nic-vm02-prod" {
    default = "10.0.0.5"
}
variable "nic-vm01-bastion" {
    default = "10.100.0.4"
}

# Availibility set
variable "prod_availibility_set" {
    default = "availibility_set_prod"
}
variable "update_domain" {
    default = 5
}
variable "fault_domain" {
    default = 3
}

# VMs
variable "vms-prod" {
    type    = list(string)
    default = ["vm01-prod", "vm02-prod"]
}

variable "vms-bastion" {
    default = "vm01-bastion"
}

variable "vm-username" {
    default = "admuser"
}

variable "username-password" {
    default = "YourPassword1"
}

# Sufix
variable "nic_sufix" {
    default = "-nic"
}

variable "os_disk_sufix" {
    default = "-os"
}