terraform {
    required_version = ">=1.1.9"
}

provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

output "pihole_compute_data" {
  value = module.pihole_compute.compute_data.public_ip
}

output "k3s_master_public_ip" {
  value = module.k3s_master_compute.compute_data.public_ip
}

output "k3s_worker1_public_ip" {
  value = module.k3s_worker1_compute.compute_data.public_ip
}

#output "k3s_worker2_public_ip" {
#  value = module.k3s_worker2_compute.compute_data.public_ip
#}