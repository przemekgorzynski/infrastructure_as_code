# ARM NODES in a loop
resource "oci_core_instance" "k8s_arm_nodes" {
    count = var.k8s_arm_nodes_number
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape = var.k8s_node_shape
    display_name = "${var.k8s_node_hostanme}${count.index+1}"
    fault_domain = var.instance_fault_domain
    freeform_tags = {"instance"= "k8s_node${count.index+1}"}
    is_pv_encryption_in_transit_enabled = true
    preserve_boot_volume = false

    metadata = {
        ssh_authorized_keys = file(var.local_public_key_path)
    }

    shape_config {
        memory_in_gbs = var.k8s_node_memory
        ocpus = var.k8s_node_ocpus
    }

    create_vnic_details {
        private_ip = "${var.k8s_nodes_prefix_internal_ip}${count.index+101}"
        assign_public_ip = true
        display_name = "k8s_arm_node${count.index+1}_nic"
        freeform_tags = {"instance"= "k8s_arm_node${count.index+1}", "subnet"= "${oci_core_subnet.k8s_subnet.display_name}"}
        hostname_label = "k8sarmnode${count.index+1}"
        subnet_id = oci_core_subnet.k8s_subnet.id
        nsg_ids = [oci_core_network_security_group.k8s_nsg.id]
    }

    launch_options {
        boot_volume_type = "PARAVIRTUALIZED"
        firmware = "UEFI_64"
        is_pv_encryption_in_transit_enabled = true
        network_type = "PARAVIRTUALIZED"
        remote_data_volume_type = "PARAVIRTUALIZED"
    }

    source_details {
        #Required
        source_id = var.image_id
        source_type = "image"
        boot_volume_size_in_gbs = 50
    }

    agent_config {
        are_all_plugins_disabled = false
        is_management_disabled = false
        is_monitoring_disabled = false
        plugins_config {
            desired_state = "ENABLED"
            name = "Vulnerability Scanning"
        }
        plugins_config {
            desired_state = "ENABLED"
            name = "Compute Instance Monitoring"
        }
    }
}

# AMD NODEs in loop
resource "oci_core_instance" "k8s_amd_nodes" {
    count = var.k8s_amd_nodes_number
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape = var.k8s_amd_node_shape
    display_name = "${var.k8s_amd_node_hostanme}${count.index+1}"
    fault_domain = var.instance_fault_domain
    is_pv_encryption_in_transit_enabled = true
    preserve_boot_volume = false

    metadata = {
        ssh_authorized_keys = file(var.local_public_key_path)
    }

    shape_config {
        memory_in_gbs = var.k8s_amd_node_memory
        ocpus = var.k8s_amd_node_ocpus
    }

    create_vnic_details {
        private_ip = "${var.k8s_nodes_prefix_internal_ip}${var.k8s_arm_nodes_number+101}"
        assign_public_ip = true
        display_name = "k8s_amd_node${count.index+1}_nic"
        freeform_tags = {"instance"= "k8s_amd_node${count.index+1}", "subnet"= "${oci_core_subnet.k8s_subnet.display_name}"}
        hostname_label = "k8samdnode${count.index+1}"
        subnet_id = oci_core_subnet.k8s_subnet.id
        nsg_ids = [oci_core_network_security_group.k8s_nsg.id]
    }

    launch_options {
        boot_volume_type = "PARAVIRTUALIZED"
        firmware = "UEFI_64"
        is_pv_encryption_in_transit_enabled = true
        network_type = "PARAVIRTUALIZED"
        remote_data_volume_type = "PARAVIRTUALIZED"
    }

    source_details {
        #Required
        source_id = var.image_id_amd
        source_type = "image"
        boot_volume_size_in_gbs = 50
    }

    agent_config {
        are_all_plugins_disabled = false
        is_management_disabled = false
        is_monitoring_disabled = false
        plugins_config {
            desired_state = "ENABLED"
            name = "Vulnerability Scanning"
        }
        plugins_config {
            desired_state = "ENABLED"
            name = "Compute Instance Monitoring"
        }
    }
}