# Authorization
# Generate with: az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
variable "service_principal_appid" { 
    default =  "f58d7989-8d04-4baf-ae78-5e596f38e4e7"
}

variable "azure_subscription_tenant_id" {
     default =  "386c08c3-f8bb-4146-a23b-ed825e141a2d"
}
variable "azure_subscription_id" {
     default =  "4fdf59e6-c21f-4086-9aa6-33808e10ce74"
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
    default = "tf_resource_group_prod"
}
variable "bastion_rg_name" {
    default = "tf_resource_group_bastion"
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
    vnet_prod = "10.160.0.0/16"
    vnet_bastion = "10.150.0.0/16"
  }
}

variable "subnet_address_spaces" {
  type = map(string)
  default = {
    vnet_prod_subnet = "10.160.0.0/24"
    vnet_bastion_subnet = "10.150.0.0/24"
  }
}

variable "pip-bastion-name" {    # Public IP name for bsation host
    default = "bastion-pip"
}

variable "pip-loadbalancer-name" {    # Public IP name for load balancer
    default = "loadbalancer-pip"
}

# NIC
variable "nic-vm01-prod" {
    default = "10.160.0.4"
}
variable "nic-vm02-prod" {
    default = "10.160.0.5"
}
variable "nic-vm01-bastion" {
    default = "10.150.0.4"
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

# Load balancer
variable "loadbalancer-name" {
    default = "lb-prod"
}

#OS variables
variable "os-publisher" {
    default = "Canonical"
}
variable "os-offer" {
    default = "UbuntuServer"
}
variable "os-sku" {
    default = "18.04-LTS"
}
variable "os-version" {
    default = "latest"
}