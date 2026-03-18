resource "aws_iam_role" "eks_cluster_role" {
    name = "${var.cluster_name}-eks-cluster-role"
    
    assume_role_policy = jsonencode({
        Version = "2012"
        Statement = [{
            Effect = "Allow"
            Principle = {
                Service = "eks.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }]
    })
}   

resource "aws_iam_policy_attachment" "eks_service_policy"{
    name = "eks-service-policy-attachment"
    roles = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_security_group" "eks-cluster-sg" {
    name = "${var.cluster_name}-eks-sg"
    description = "Security group for EKS control plane"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_eks_cluster" "this" {
    name = var.cluster_name
    version = var.cluster_version
    role_arn = aws_iam_role.eks_cluster_role

    vpc_config {
      subnet_ids = var.subnets
      security_group_ids = [aws_security_group.eks-cluster-sg]
      endpoint_public_access = var.endpoint_public_access
      endpoint_private_access = var.endpoint_private_access
    }
  
}