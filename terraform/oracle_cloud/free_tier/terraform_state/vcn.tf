resource "oci_core_vcn" "vcn" {
    compartment_id = var.compartment_id
    display_name = var.vcn_name
    cidr_block = var.vcn_address_space.vcn
    is_ipv6enabled = var.vcn_is_ipv6enabled
    dns_label = "vcn"
#    default_route_table_id = oci_core_route_table.route_table.id
}

resource "oci_core_subnet" "pihole_subnet" {
    cidr_block = var.subnet_cidr_block.vcn_pihole_subnet
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    prohibit_internet_ingress = false
    prohibit_public_ip_on_vnic = false
    dns_label = "pisubnet"
    display_name = var.subnet_names.subnet_pihole
    freeform_tags = {"subnet"= "pihole"}
    security_list_ids = [oci_core_security_list.pihole_security_list.id]
}

resource "oci_core_subnet" "monitoring_subnet" {
    cidr_block = var.subnet_cidr_block.vcn_test_subnet
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    display_name = var.subnet_names.subnet_monitoring
    freeform_tags = {"subnet"= "monitoring"}
    prohibit_internet_ingress = false
    prohibit_public_ip_on_vnic = false
    dns_label = "monitorsubnet"
    security_list_ids = [oci_core_security_list.monitoring_security_list.id]
}

resource "oci_core_internet_gateway" "internet_gateway" {
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    enabled = true
    display_name = var.internet_gateway_display_name
}


#Instead of creating new route table exist existing one which always come as default with VCN creation
resource "oci_core_default_route_table" "route_table" {
    manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
    compartment_id = var.compartment_id
    route_rules {
        network_entity_id = oci_core_internet_gateway.internet_gateway.id
        destination = "0.0.0.0/0"
        description = "Route table to allow Internet access"
    }
}