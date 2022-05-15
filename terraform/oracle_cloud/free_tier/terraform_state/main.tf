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

output "monitoring_compute_data" {
  value = module.monitoring_compute.compute_data.public_ip
}