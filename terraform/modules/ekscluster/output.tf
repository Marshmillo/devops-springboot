output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "token" {
  value = element(concat(aws_eks_cluster.eks.certificate_authority, list("")), 0)
}

