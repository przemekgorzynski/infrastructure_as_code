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

#NETWORKING
variable "vcn_name" {
    default = "Oracle-vcn"
}

variable "vcn_is_ipv6enabled" {
    default = "false"
}

variable "pihole_security_list_name" {
    default = "Pihole Security List"
}

variable "test_security_list_name" {
    default = "Test env Security List"
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
    vcn_pihole_subnet = "10.0.1.0/24"
    vcn_test_subnet = "10.0.2.0/24"
  }
}

variable "subnet_names" {
  type = map(string)
  default = {
    subnet_pihole = "pihole_subnet"
    subnet_test = "test_subnet"
  }
}

variable "pihole_internal_ip" {
    default = "10.0.1.100"
}

#########################################################
#INSTANCE PIHOLE
variable "pihole_hostanme" {
    default = "pihole"
}

variable "pihole_shape" {
    default = "VM.Standard.A1.Flex"
}

variable "pihole_ocpus" {
    default = "1"
}

variable "pihole_memory" {
    default = "3"
}

variable "instance_fault_domain" {
    default = "FAULT-DOMAIN-2"
}

variable "local_public_key_path" {
    default = "~/.ssh/id_rsa.pub"
}

#https://docs.oracle.com/en-us/iaas/images/ - images #Ubuntu20
variable "image_id" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa6ueulrtedgclrxznl5pkzhzseddl7b6iq6jhdl3vjm62zhddpxta"
}

#PIHOLE BLOCK VOLUME
variable "block_volume_name" {
    default = "pihole_block_volume"
}

variable "volume_size_in_gbs" {
    default = "50"
}

variable "volume_vpus_per_gb" {
    default = "10"  # 0-lower cost 10-balanced 20-high performance
}

variable "volume_device" {
    default = "/dev/oracleoci/oraclevdb"
}