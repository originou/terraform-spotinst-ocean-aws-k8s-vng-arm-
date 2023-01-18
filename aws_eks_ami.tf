data "aws_ami" "aws_eks_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}


## for amd you can use this. 
#data "aws_ami" "aws_amd_ami" {
#  most_recent = true
#  owners      = ["amazon"]
#  filter {
#    name   = "architecture"
#    values = ["x86_64"]
#  }
#}
