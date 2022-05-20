resource "oci_core_instance" "compute" {
    availability_domain                     = "WHWJ:EU-FRANKFURT-1-AD-2"
    compartment_id                          = var.compartment_id
    shape                                   = var.shape
    display_name                            = var.hostname
    fault_domain                            = var.fault_domain
    is_pv_encryption_in_transit_enabled     = true
    preserve_boot_volume                    = false

    metadata = {
        ssh_authorized_keys                 = file(var.local_public_key_path)
        user_data                           = var.user_data_base64
    }

    shape_config {
        memory_in_gbs                       = var.memory
        ocpus                               = var.ocpus
    }

    create_vnic_details {
        private_ip                          = var.private_ip
        assign_public_ip                    = true
        display_name                        = var.vnic_name
        hostname_label                      = var.dns_label
        subnet_id                           = var.subnet
        nsg_ids                             = var.nsg_ids           
    }

    launch_options {
        boot_volume_type                    = "PARAVIRTUALIZED"
        firmware                            = "UEFI_64"
        is_pv_encryption_in_transit_enabled = true
        network_type                        = "PARAVIRTUALIZED"
        remote_data_volume_type             = "PARAVIRTUALIZED"
    }

    source_details {
        #Required
        source_id                           = var.image_id
        source_type                         = "image"
        boot_volume_size_in_gbs             = 50
    }

    agent_config {
        are_all_plugins_disabled            = false
        is_management_disabled              = false
        is_monitoring_disabled              = false
        plugins_config {
            desired_state                   = "ENABLED"
            name                            = "Vulnerability Scanning"
        }
        plugins_config {
            desired_state                   = "ENABLED"
            name                            = "Compute Instance Monitoring"
        }
    }
}