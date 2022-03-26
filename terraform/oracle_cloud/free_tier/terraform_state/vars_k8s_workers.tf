#########################################################
# ARM NODE INSTANCE

variable "k8s_arm_nodes_number" {
    default = "2"
}

variable "k8s_node_hostanme" {
    default = "k8s_arm_node"
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

#########################################################
# AMD NODE INSTANCE

variable "k8s_amd_nodes_number" {
    default = "0"
}

variable "k8s_amd_node_hostanme" {
    default = "k8s_amd_node"
}

variable "k8s_amd_node_ocpus" {
    default = "1"
}

variable "k8s_amd_node_memory" {
    default = "1"
}

variable "k8s_amd_node_shape" {
    default = "VM.Standard.E2.1.Micro"
}



