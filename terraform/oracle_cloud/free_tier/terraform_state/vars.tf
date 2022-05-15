#CONECTION
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}


variable "compartment_id" { 
    default = "ocid1.tenancy.oc1..aaaaaaaai6pwlqfxlt2bw7jw5uti2hf2jnwmaxr6wdyrap3q7pqxbjn4bvwa"
}

variable "region" { 
    default = "eu-frankfurt-1"
}

variable "availability_domain" { 
    default = "WHWJ:EU-FRANKFURT-1-AD-2"
}

variable "instance_fault_domain" {
    default = "FAULT-DOMAIN-2"
}

variable "local_public_key_path" {
    default = "~/.ssh/id_rsa.pub"
}

#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
variable "image_id" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafofmp3otdb5fh3ged2zhsepoh3e2dkaus636uee4vpt7jrgqssma"
}

variable "image_id_amd" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa2lrlzhaj5gsr7zrn3u4tzzh52usfnarabgjz7236hrrxaeomo5va"
}

#Ubuntu20
#AARCH64 ocid1.image.oc1.eu-frankfurt-1.aaaaaaaafofmp3otdb5fh3ged2zhsepoh3e2dkaus636uee4vpt7jrgqssma
#Minimal ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa2lrlzhaj5gsr7zrn3u4tzzh52usfnarabgjz7236hrrxaeomo5va

variable "volume_device" {
    default = "/dev/oracleoci/oraclevdb"
}


#NETWORKING
variable "vcn_name" {
    default = "Oracle-vcn"
}

variable "vcn_is_ipv6enabled" {
    default = "false"
}


variable "internet_gateway_display_name" {
    default = "Internet gateway"
}

variable "route_table_display_name" {
    default = "Route table"
}

variable "vcn_address_space" {
  type = map(string)
  default = {
    vcn = "10.0.0.0/16"
  }
}

variable "subnet_cidr_block" {
  type = map(string)
  default = {
    piholeSubnet = "10.0.1.0/24"
    testSubnet   = "10.0.2.0/24"
  }
}

variable "subnet_names" {
  type = map(string)
  default = {
    piholeSubnet = "pihole_subnet"
    testSubnet = "test_subnet"
  }
}

variable "k8s_security_list_name" {
    default = "K8s Security List"
}

variable "k8s_master_internal_ip" {
    default = "10.0.2.100"
}

variable "k8s_nodes_prefix_internal_ip" {
    default = "10.0.2."
}