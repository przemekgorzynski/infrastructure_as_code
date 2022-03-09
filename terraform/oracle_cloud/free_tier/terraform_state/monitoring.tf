resource "oci_core_instance" "monitoring" {
    availability_domain = var.availability_domain
    compartment_id = var.compartment_id
    shape = var.monitoring_shape
    display_name = var.monitoring_hostanme
    fault_domain = var.instance_fault_domain
    freeform_tags = {"instance"= "monitoring"}
    is_pv_encryption_in_transit_enabled = true
    preserve_boot_volume = false

    metadata = {
        ssh_authorized_keys = file(var.local_public_key_path)
    }

    shape_config {
        memory_in_gbs = var.monitoring_memory
        ocpus = var.monitoring_ocpus
    }

    create_vnic_details {
        private_ip = var.monitoring_internal_ip
        assign_public_ip = true
        display_name = "monitoring_nic"
        freeform_tags = {"instance"= "monitoring", "subnet"= "${oci_core_subnet.monitoring_subnet.display_name}"}
        hostname_label = "monitoring"
        subnet_id = oci_core_subnet.monitoring_subnet.id
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