output "Pihole_IP" {
    value = oci_core_instance.pihole.public_ip
}