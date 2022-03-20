output "K8s_master_IP" {
    value = oci_core_instance.k8s_master.public_ip
}