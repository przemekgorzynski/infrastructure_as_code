output "K8s_master_IP" {
    value = oci_core_instance.k8s_master.public_ip
}

output "K8s_arm_workers_IP" {
    value = oci_core_instance.k8s_arm_nodes.*.public_ip
}

output "K8s_amd_workers_IP" {
    value = oci_core_instance.k8s_amd_nodes.*.public_ip
}