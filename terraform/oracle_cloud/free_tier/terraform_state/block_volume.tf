resource "oci_core_volume" "k3s_block_volume" {
    #Required
    compartment_id          = var.compartment_id

    #Optional
    availability_domain     = var.availability_domain
    display_name            = var.k3s_block_display_name
    is_auto_tune_enabled    = true
    size_in_gbs             = var.k3s_block_volume_size_in_gbs
    vpus_per_gb             = var.k3s_block_volume_vpus_per_gb
}


resource "oci_core_volume_attachment" "k3s_block_volume_attachment" {
    attachment_type         = "iscsi"
    instance_id             = module.k3s_master_compute.compute_data.id
    volume_id               = oci_core_volume.k3s_block_volume.id
    device                  = var.volume_device
    display_name            = "k3s_master_block_volume_attachment"
    is_read_only            = false
    is_shareable            = false
}


resource "oci_core_volume" "pihole_block_volume" {
    #Required
    compartment_id          = var.compartment_id

    #Optional
    availability_domain     = var.availability_domain
    display_name            = var.pihole_block_display_name
    is_auto_tune_enabled    = true
    size_in_gbs             = var.pihole_block_volume_size_in_gbs
    vpus_per_gb             = var.pihole_block_volume_vpus_per_gb
}


resource "oci_core_volume_attachment" "pihole_block_volume_attachment" {
    attachment_type         = "iscsi"
    instance_id             = module.pihole_compute.compute_data.id
    volume_id               = oci_core_volume.pihole_block_volume.id
    device                  = var.volume_device
    display_name            = "pihole_block_volume_attachment"
    is_read_only            = false
    is_shareable            = false
}