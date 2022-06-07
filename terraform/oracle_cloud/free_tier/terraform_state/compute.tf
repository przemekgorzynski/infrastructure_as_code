module "pihole_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain1
    shape                   = var.pihole_shape
    hostname                = var.pihole_hostname
    local_public_key_path   = var.local_public_key_path
    memory                  = var.pihole_memory
    ocpus                   = var.pihole_ocpus
    private_ip              = var.pihole_private_ip
    vnic_name               = "pihole_vnic"
    subnet                  = module.pihole_subnet.subnet_data.id
    dns_label               = "pihole-vm"
    image_id                = var.pihole_image_id
    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
    nsg_ids                 = [oci_core_network_security_group.pihole_nsg.id]
}

module "k3s_master_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain1
    shape                   = var.k3s_master_shape
    hostname                = var.k3s_master_hostname
    local_public_key_path   = var.local_public_key_path
    memory                  = var.k3s_master_memory
    ocpus                   = var.k3s_master_ocpus
    private_ip              = var.k3s_master_private_ip
    vnic_name               = "k3s_master_vnic"
    subnet                  = module.k3s_subnet.subnet_data.id
    dns_label               = "k3s-master-vm"
    image_id                = var.k3s_image_id
    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
    nsg_ids                 = [oci_core_network_security_group.k3s_nsg.id]
}

module "k3s_worker1_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain1
    shape                   = var.k3s_worker_shape
    hostname                = var.k3s_worker1_hostname
    local_public_key_path   = var.local_public_key_path
    memory                  = var.k3s_worker_memory
    ocpus                   = var.k3s_worker_ocpus
    private_ip              = var.k3s_worker1_private_ip
    vnic_name               = "k3s_worker1_vnic"
    subnet                  = module.k3s_subnet.subnet_data.id
    dns_label               = "k3s-worker1-vm"
    image_id                = var.k3s_image_id
    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
    nsg_ids                 = [oci_core_network_security_group.k3s_nsg.id]
}

#module "k3s_worker2_compute"{
#    source                  = "./modules/compute"
#    compartment_id          = var.compartment_id
#    fault_domain            = var.fault_domain2
#    shape                   = var.k3s_worker_shape
#    hostname                = var.k3s_worker2_hostname
#    local_public_key_path   = var.local_public_key_path
#    memory                  = var.k3s_worker_memory
#    ocpus                   = var.k3s_worker_ocpus
#    private_ip              = var.k3s_worker2_private_ip
#    vnic_name               = "k3s_worker2_vnic"
#    subnet                  = module.k3s_subnet.subnet_data.id
#    dns_label               = "k3s-worker2-vm"
#    image_id                = var.k3s_image_id
#    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
#    nsg_ids                 = [oci_core_network_security_group.k3s_nsg.id]
#}