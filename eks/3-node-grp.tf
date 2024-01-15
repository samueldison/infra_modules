resource "aws_eks_node_group" "workers" {
  for_each        = var.node_groups
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.workers.arn
  subnet_ids      = var.subnet_ids
  capacity_type   = each.value.capacity_type
  instance_types  = each.value.instance_types
  disk_size       = each.value.disk_size

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
    source_security_group_ids = var.source_security_group_ids
  }

  scaling_config {
    desired_size = each.value.scaling_config.desired_size
    max_size     = each.value.scaling_config.max_size
    min_size     = each.value.scaling_config.min_size
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = each.key
  }

  depends_on = [aws_iam_role_policy_attachment.workers]
}