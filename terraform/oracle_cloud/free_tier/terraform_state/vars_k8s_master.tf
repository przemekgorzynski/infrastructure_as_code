#########################################################
#INSTANCE K8S Master
variable "k8s_master_hostanme" {
    default = "k8s_arm_master"
}

variable "k8s_master_shape" {
    default = "VM.Standard.A1.Flex"
}

variable "k8s_master_ocpus" {
    default = "2"
}

variable "k8s_master_memory" {
    default = "12"
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