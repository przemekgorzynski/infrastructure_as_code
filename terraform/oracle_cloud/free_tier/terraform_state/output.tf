output "Pihole_IP" {
    value = oci_core_instance.pihole.public_ip
}

output "Monitoring_IP" {
    value = oci_core_instance.monitoring.public_ip
}