resource "oci_core_volume" "k8s_master_volume" {
    #Required
    compartment_id = var.compartment_id

    #Optional
    availability_domain = var.availability_domain
    display_name = var.k8s_master_block_volume_name
    is_auto_tune_enabled = true
    size_in_gbs = var.k8s_master_volume_size_in_gbs
    vpus_per_gb = var.k8s_master_volume_vpus_per_gb
}


resource "oci_core_volume_attachment" "k8s_master_volume_attachment" {
    attachment_type = "iscsi"
    instance_id = oci_core_instance.k8s_master.id
    volume_id = oci_core_volume.k8s_master_volume.id
    device = var.volume_device
    display_name = "k8s_master_block_volume_attachment"
    is_read_only = false
    is_shareable = false
}