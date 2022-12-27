provider "spotinst" {
  token   = var.spotinst_token
  account = var.spotinst_account
}

provider "aws" {
  region = var.aws_region
}


## Create Ocean Virtual Node Group (launchspec) ##
## On demand - ARM
module "ocean-aws-k8s-vng_od_arm" {
  source = "spotinst/ocean-aws-k8s-vng/spotinst"

  cluster_name = var.cluster_name
  ocean_id     = var.ocean_id

  # Name of VNG in Ocean

  name = "ocean-spark-on-demand-arm"

  #  image_id             = var.image_id
  image_id = var.image_id != null ? var.image_id : data.aws_ami.aws_eks_ami.image_id
  #image_id = "ami-0feb00ba334177fc3"

  # Spot at 0%
  spot_percentage = 0

  min_instance_count = 1

  # Root volume size (null to take from vng template)
  root_volume_size = null


  # Add Labels or taints
  labels = [{ key = "bigdata.spot.io/vng", value = "ocean-spark" }]

  taints = [{
    key    = "bigdata.spot.io/unschedulable",
    value  = "ocean-spark",
    effect = "NoSchedule"
  }]
}

## Create Ocean Virtual Node Group (launchspec) ##
## Spot - ARM
module "ocean-aws-k8s-vng_spot_arm" {
  source = "spotinst/ocean-aws-k8s-vng/spotinst"

  cluster_name = var.cluster_name
  ocean_id     = var.ocean_id

  # Name of VNG in Ocean
  name = "ocean-spark-spot-arm"

  image_id = data.aws_ami.aws_eks_ami.image_id

  min_instance_count = 1

  # Spot at 100%
  spot_percentage = 100

  # Root volume size (null to take from vng template)
  root_volume_size = null

  # Add Labels or taints
  labels = [{ key = "bigdata.spot.io/vng", value = "ocean-spark" }]

  taints = [{
    key    = "bigdata.spot.io/unschedulable",
    value  = "ocean-spark",
    effect = "NoSchedule"
  }]
}
