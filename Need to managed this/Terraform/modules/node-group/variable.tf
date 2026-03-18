########################################
# Cluster Reference
########################################

variable "cluster_name" {
  description = "Name of the EKS cluster to attach the node group to"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs where worker nodes will be created"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
}

variable "instance_types" {
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
}

variable "capacity_type" {
  description = "Capacity type for nodes (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "tags" {
  description = "Tags to apply to node group resources"
  type        = map(string)
  default     = {}
}
