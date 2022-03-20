resource "oci_core_security_list" "mgmnt_security_list" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    #Optional
    freeform_tags = {"env"= "Prod"}
    display_name = var.mgmnt_security_list_name
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "all"         #ICMP ("1"), TCP ("6"), UDP ("17")
    }

    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "1"      #ICMP ("1"), TCP ("6"), UDP ("17")
    }

    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "6"      #ICMP ("1"), TCP ("6"), UDP ("17")
        tcp_options {
            max = "22"
            min = "22"
        }
    }
}

resource "oci_core_security_list" "k8s_security_list" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.vcn.id

    #Optional
    freeform_tags = {"env"= "Prod"}
    display_name = var.k8s_security_list_name
    egress_security_rules {
        destination = "0.0.0.0/0"
        protocol = "all"         #ICMP ("1"), TCP ("6"), UDP ("17")
    }

    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "1"      #ICMP ("1"), TCP ("6"), UDP ("17")
    }

    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "6"      #ICMP ("1"), TCP ("6"), UDP ("17")
        tcp_options {
            max = "22"
            min = "22"
        }
    }
    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "6"
        tcp_options {
            max = "80"
            min = "80"
        }
    }
    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "6"
        tcp_options {
            max = "443"
            min = "443"
        }
    }
    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "6"
        tcp_options {
            max = "8090"
            min = "8080"
        }
    }
    ingress_security_rules {
        #Required
        source = "0.0.0.0/0"
        protocol = "17"
        udp_options {
            max = "53"
            min = "53"
        }
    }
}