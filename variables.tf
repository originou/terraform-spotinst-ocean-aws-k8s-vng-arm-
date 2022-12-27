variable "spotinst_token" {
  type = string
}
variable "spotinst_account" {
  type        = string
  description = "Spot Account act-xxxx"
}
variable "aws_region" {
  type        = string
  description = "Region of the Aws cluster"
}

variable "image_id" {
  type        = string
  description = "AMI id of EKS image, if null: will find other aws_ami module an AMD image (with k8s v1.21)"
  default     = null
}

### Required Ocean VNG (Launch Spec) Configurations
variable "ocean_id" {
  type        = string
  description = "Ocean cluster ID o-*****"
}
variable "cluster_name" {
  type        = string
  description = "Name of Cluster"
}
