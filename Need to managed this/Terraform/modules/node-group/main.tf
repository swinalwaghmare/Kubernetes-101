resource "aws_iam_role" "node_group_role" {
    name = "${var.cluster_name}-node-group-role"

    assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [{
    Effect = "Allow"
    Principal = {
      Service = "ec2.amazonaws.com"
    }
    Action = "sts:AssumeRole"
  }]
})
}

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_eks_node_group" "this" {
    cluster_name    = var.cluster_name
    node_group_name = var.node_group_name
    node_role_arn  = aws_iam_role.node_group_role.arn
    subnet_ids = var.subnet_ids
    instance_types = var.instance_types
    capacity_type  = var.capacity_type

    scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
    }
    tags = var.tags
}