resource "oci_core_vcn" "vcn" {
    compartment_id = var.compartment_id
    display_name = var.vcn_name
    cidr_block = var.vcn_address_space.vcn
    is_ipv6enabled = var.vcn_is_ipv6enabled
    dns_label = "vcn"
#    default_route_table_id = oci_core_route_table.route_table.id
}

resource "oci_core_subnet" "mgmnt_subnet" {
    cidr_block = var.subnet_cidr_block.vcn_mgmnt_subnet
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    display_name = var.subnet_names.subnet_mgmnt
    freeform_tags = {"subnet"= "mgmnt"}
    prohibit_internet_ingress = false
    prohibit_public_ip_on_vnic = false
    dns_label = "mgmntsubnet"
    security_list_ids = [oci_core_security_list.mgmnt_security_list.id]
}

resource "oci_core_subnet" "k8s_subnet" {
    cidr_block = var.subnet_cidr_block.vcn_k8s_subnet
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    display_name = var.subnet_names.subnet_k8s
    freeform_tags = {"subnet"= "k8s"}
    prohibit_internet_ingress = false
    prohibit_public_ip_on_vnic = false
    dns_label = "k8ssubnet"
    security_list_ids = [oci_core_security_list.k8s_security_list.id]
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