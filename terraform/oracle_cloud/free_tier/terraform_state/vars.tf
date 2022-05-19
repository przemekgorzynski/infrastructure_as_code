#CONECTION
variable "tenancy_ocid"                     {}
variable "user_ocid"                        {}
variable "fingerprint"                      {}
variable "private_key_path"                 {}

#GENERAL
variable "compartment_id"                   { default = "ocid1.tenancy.oc1..aaaaaaaai6pwlqfxlt2bw7jw5uti2hf2jnwmaxr6wdyrap3q7pqxbjn4bvwa" }
variable "region"                           { default = "eu-frankfurt-1" }
variable "availability_domain"              { default = "WHWJ:EU-FRANKFURT-1-AD-2" }
variable "fault_domain"                     { default = "FAULT-DOMAIN-2" }
variable "local_public_key_path"            { default = "~/.ssh/id_rsa.pub" }
variable "volume_device"                    { default = "/dev/oracleoci/oraclevdb" }


#NETWORKING
variable "vcn_name"                         { default = "Oracle-vcn" }
variable "vcn_is_ipv6enabled"               { default = "false" }
variable "internet_gateway_display_name"    { default = "Internet gateway" }
variable "route_table_display_name"         { default = "Route table" }
variable "vcn_address_space" {
  type = map(string)
  default = {
    vcn               = "10.0.0.0/16"
  }
}
variable "subnet_cidr_block" {
  type = map(string)
  default = {
    piholeSubnet      = "10.0.1.0/24"
    monitoringSubnet  = "10.0.2.0/24"
    k3sSubnet         = "10.0.3.0/24"
  }
}
variable "subnet_names" {
  type = map(string)
  default = {
    piholeSubnet      = "pihole_subnet"
    monitoringSubnet  = "monitoring_subnet"
    k3sSubnet         = "k3s_subnet"
  }
}

#PIHOLE
variable "pihole_hostname"                  { default = "pihole-vm" }
variable "pihole_shape"                     { default = "VM.Standard.A1.Flex" }
variable "pihole_memory"                    { default = "4" }
variable "pihole_ocpus"                     { default = "1" }
variable "pihole_private_ip"                { default = "10.0.1.100" }
#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
variable "pihole_image_id"                  { default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafofmp3otdb5fh3ged2zhsepoh3e2dkaus636uee4vpt7jrgqssma" }


# MONITORING
variable "monitoring_hostname"              { default = "monitoring-vm" }
variable "monitoring_shape"                 { default = "VM.Standard.A1.Flex" }
variable "monitoring_memory"                { default = "4" }
variable "monitoring_ocpus"                 { default = "1" }
variable "monitoring_private_ip"            { default = "10.0.2.100" }
#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
variable "monitoring_image_id"              { default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafofmp3otdb5fh3ged2zhsepoh3e2dkaus636uee4vpt7jrgqssma" }


#K3S-MASTER
variable "k3s_master_hostname"                  { default = "k3s-master-vm" }
variable "k3s_master_shape"                     { default = "VM.Standard.A1.Flex" }
variable "k3s_master_memory"                    { default = "4" }
variable "k3s_master_ocpus"                     { default = "1" }
variable "k3s_master_private_ip"                { default = "10.0.3.100" }
#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
variable "k3s_image_id"                  { default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafofmp3otdb5fh3ged2zhsepoh3e2dkaus636uee4vpt7jrgqssma" }

#K3S-WORKER
variable "k3s_worker_hostname"                  { default = "k3s-worker1-vm" }
variable "k3s_worker_shape"                     { default = "VM.Standard.A1.Flex" }
variable "k3s_worker_memory"                    { default = "4" }
variable "k3s_worker_ocpus"                     { default = "1" }
variable "k3s_worker1_private_ip"               { default = "10.0.3.101" }
#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
