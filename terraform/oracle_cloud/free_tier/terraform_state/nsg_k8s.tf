resource "oci_core_network_security_group" "k8s_nsg" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id
    display_name = "k8s_subnet_nsg"
}


resource "oci_core_network_security_group_security_rule" "k8s_nsg_egress" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}


resource "oci_core_network_security_group_security_rule" "k8s_nsg_ingress_6443" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

resource "oci_core_network_security_group_security_rule" "k8s_nsg_ingress_22" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 6443
      min = 6443
    }
  }
}

resource "oci_core_network_security_group_security_rule" "k8s_nsg_ingress_self" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      min = 10250
      max = 10260
    }
  }
}

resource "oci_core_network_security_group_security_rule" "k8s_nsg_ingress_etcd" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      min = 2379
      max = 2380
    }
  }
}

resource "oci_core_network_security_group_security_rule" "k8s_nsg_ingress_node_port_service" {
  network_security_group_id = oci_core_network_security_group.k8s_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      min = 30000
      max = 32767
    }
  }
}