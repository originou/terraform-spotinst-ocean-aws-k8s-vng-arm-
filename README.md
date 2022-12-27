# Create ARM VNGs on Ocean Spark By Spot

## Motivation

- create Vngs with ARM instance type on an existing Ocean Spark Cluster using `terraform`
- 2 Vngs (1 for OD, 1 for Spot)

## Requirements

- `terraform` tool
- AWS profile credentials (var env `AWS_PROFILE`)

The terraform description will create 2 simple VNGs (OD + Spot) with

## Setup

- create a local variable file. e.g: `touch terraform.tfvars`
  - `spotinst_account`: Spot account act-xxxx
  - `spotinst_token`: Spot token
  - `aws_region`: region of the AWS cluster e.g us-west-2
  - `ocean_id`: ocean cluster o-xxxxxx
  - `cluster_name` : name of the cluster
  - `image_id`: AMI id of the EKS node image (ARM), let it to null to let the module `aws_ami` find it itself.

## Steps

- init terraform : `terraform init`
- apply the creation : `terraform apply`

- to remove the VNGs (revert): `terraform destroy`
