variable "cluster_name" {
    type = string
    description = "Name of the EKS cluster"
}

variable "tags" {
    type = string
    default = "cluster" 
}

variable "cluster_version" {
    description = "Kubernetes version for the EKS cluster"
    type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be created"
  type        = string
}


variable "subnets" {
  description = "List of subnet IDs for EKS cluster"
  type        = list(string)
}


variable "endpoint_public_access" {
  description = "Whether the EKS public API server endpoint is enabled"
  type        = bool
  default     = true
}


variable "endpoint_private_access" {
  description = "Whether the EKS private API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to EKS resources"
  type        = map(string)
  default     = {}
}
