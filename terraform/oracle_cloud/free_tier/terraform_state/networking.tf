#Networking
resource "oci_core_vcn" "vcn" {
    compartment_id              = var.compartment_id
    display_name                = var.vcn_name
    cidr_block                  = var.vcn_address_space.vcn
    is_ipv6enabled              = var.vcn_is_ipv6enabled
    dns_label                   = "vcn"
#    default_route_table_id = oci_core_route_table.route_table.id
}
resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id              = var.compartment_id
    vcn_id                      = oci_core_vcn.vcn.id
    enabled                     = true
    display_name                = var.internet_gateway_display_name
}
resource "oci_core_default_route_table" "route_table" {
    manage_default_resource_id  = oci_core_vcn.vcn.default_route_table_id
    compartment_id              = var.compartment_id
    route_rules {
        network_entity_id       = oci_core_internet_gateway.internet_gateway.id
        destination             = "0.0.0.0/0"
        description             = "Route table to allow Internet access"
    }
}

module "pihole_subnet" {
    source                      = "./modules/subnets"
    compartment_id              = var.compartment_id
    subnet_cidr_block           = var.subnet_cidr_block.piholeSubnet
    oci_core_vcn                = oci_core_vcn.vcn.id
    subnet_name                 = var.subnet_names.piholeSubnet
    dns_label                   = "pihole"
}

module "monitoring_subnet" {
    source                      = "./modules/subnets"
    compartment_id              = var.compartment_id
    subnet_cidr_block           = var.subnet_cidr_block.monitoringSubnet
    oci_core_vcn                = oci_core_vcn.vcn.id
    subnet_name                 = var.subnet_names.monitoringSubnet
    dns_label                   = "monitoring"
}

module "k3s_subnet" {
    source                      = "./modules/subnets"
    compartment_id              = var.compartment_id
    subnet_cidr_block           = var.subnet_cidr_block.k3sSubnet
    oci_core_vcn                = oci_core_vcn.vcn.id
    subnet_name                 = var.subnet_names.k3sSubnet
    dns_label                   = "k3s"
}