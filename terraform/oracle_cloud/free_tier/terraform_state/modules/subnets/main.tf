resource "oci_core_subnet" "subnet" {
    cidr_block                  = var.subnet_cidr_block
    compartment_id              = var.compartment_id
    vcn_id                      = var.oci_core_vcn
    display_name                = var.subnet_name
    prohibit_internet_ingress   = false
    prohibit_public_ip_on_vnic  = false
    dns_label                   = var.dns_label
}