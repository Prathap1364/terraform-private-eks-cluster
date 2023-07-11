resource "aws_eks_cluster" "eks" {
  name     = "eks-cluster-workload"
  role_arn = aws_iam_role.eks-cluster-iam-role.arn
  version  = "1.26"

  vpc_config {
    subnet_ids              = ["${aws_subnet.public1-subnet1.id}", "${aws_subnet.public2-subnet2.id}"]
    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]

  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    "aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController",
  ]

}


resource "aws_eks_addon" "eks-addons3" {
  addon_name = "kube-proxy"
  #addon_version = "latest"
  cluster_name             = aws_eks_cluster.eks.name
  service_account_role_arn = aws_iam_role.eks-cluster-iam-role.arn
}
