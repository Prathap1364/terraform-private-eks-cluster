resource "aws_eks_node_group" "eks-nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  ami_type        = "AL2_x86_64_GPU"
  disk_size       = "20"
  instance_types = ["t3.medium"]

  node_group_name = "EKS_NODE_GROUP_WORKLOAD"
  node_role_arn   = aws_iam_role.eks-nodegroup-iam-role.arn
  subnet_ids      = ["${aws_subnet.public1-subnet1.id}", "${aws_subnet.public2-subnet2.id}"]
  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }


}