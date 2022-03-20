variable "k8s_security_list_name" {
    default = "K8s Security List"
}

variable "k8s_master_internal_ip" {
    default = "10.0.2.100"
}

variable "k8s_nodes_prefix_internal_ip" {
    default = "10.0.2."
}

#########################################################
#INSTANCE K8S Master
variable "k8s_master_hostanme" {
    default = "k8s_master"
}

variable "k8s_master_shape" {
    default = "VM.Standard.A1.Flex"
}

variable "k8s_master_ocpus" {
    default = "2"
}

variable "k8s_master_memory" {
    default = "16"
}

#K8s BLOCK VOLUME
variable "k8s_master_block_volume_name" {
    default = "k8s_master_block_volume"
}

variable "k8s_master_volume_size_in_gbs" {
    default = "50"
}

variable "k8s_master_volume_vpus_per_gb" {
    default = "10"  # 0-lower cost 10-balanced 20-high performance
}

#########################################################
#NODE INSTANCE

variable "k8s_nodes_number" {
    default = "1"
}

variable "k8s_node_hostanme" {
    default = "k8s_node"
}

variable "k8s_node_shape" {
    default = "VM.Standard.A1.Flex"
}

variable "k8s_node_ocpus" {
    default = "1"
}

variable "k8s_node_memory" {
    default = "4"
}