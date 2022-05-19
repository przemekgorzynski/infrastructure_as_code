module "pihole_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain
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
}

module "monitoring_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain
    shape                   = var.monitoring_shape
    hostname                = var.monitoring_hostname
    local_public_key_path   = var.local_public_key_path
    memory                  = var.monitoring_memory
    ocpus                   = var.monitoring_ocpus
    private_ip              = var.monitoring_private_ip
    vnic_name               = "monitoring_vnic"
    subnet                  = module.monitoring_subnet.subnet_data.id
    dns_label               = "monitoring-vm"
    image_id                = var.monitoring_image_id
    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
}

module "k3s_master_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain
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
}

module "k3s_worker1_compute"{
    source                  = "./modules/compute"
    compartment_id          = var.compartment_id
    fault_domain            = var.fault_domain
    shape                   = var.k3s_worker_shape
    hostname                = var.k3s_worker_hostname
    local_public_key_path   = var.local_public_key_path
    memory                  = var.k3s_worker_memory
    ocpus                   = var.k3s_worker_ocpus
    private_ip              = var.k3s_worker1_private_ip
    vnic_name               = "k3s_worker1_vnic"
    subnet                  = module.k3s_subnet.subnet_data.id
    dns_label               = "k3s-worker1-vm"
    image_id                = var.k3s_image_id
    user_data_base64        = filebase64("${path.module}/cloud-init.yaml")
}