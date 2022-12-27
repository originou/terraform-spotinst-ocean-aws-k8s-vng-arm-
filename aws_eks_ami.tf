data "aws_ami" "aws_eks_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amazon-eks-arm64-node-1.21-*"]
  }
}
