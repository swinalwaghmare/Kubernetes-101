########################################
# Node Group Name
########################################

output "node_group_name" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.this.node_group_name
}

########################################
# Node Group ARN
########################################

output "node_group_arn" {
  description = "ARN of the EKS managed node group"
  value       = aws_eks_node_group.this.arn
}

########################################
# Worker Node IAM Role
########################################

output "node_role_arn" {
  description = "IAM role ARN assumed by worker nodes"
  value       = aws_iam_role.node_group_role.arn
}

########################################
# Node Group Status
########################################

output "node_group_status" {
  description = "Current status of the node group"
  value       = aws_eks_node_group.this.status
}

########################################
# Auto Scaling Group Names
########################################

output "autoscaling_group_names" {
  description = "Auto Scaling Groups backing the managed node group"
  value       = aws_eks_node_group.this.resources[0].autoscaling_groups[*].name
}
