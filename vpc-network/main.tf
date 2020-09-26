/**
Phase #1

 — Network
  — Virtual Network (VPC)
  — Subnets
  — Availability zone
  — Internet Gateway

 — Compute
  — Google Cloud Compute Engine (GCE)

 — Document
  — How to using terraform script.
 */

provider "google" {
  version = "~> 3.3.0"
  project     = var.project_id
  region      = var.vpc_region
}

provider "null" {
  version = "~> 2.1"
}


locals {
  subnet_01 = "${var.network_name}-subnet-01"
  subnet_02 = "${var.network_name}-subnet-02"
  subnet_03 = "${var.network_name}-subnet-03"
}

## VPC and Subnet

module "vpc-module" {
  source       = "../"
  project_id   = var.project_id
  network_name = var.network_name

  subnets = [
    {
      subnet_name     = "${local.subnet_01}"
      subnet_ip       = "10.10.10.0/24"
      subnet_region   = "${var.vpc_region}"
    },
    {
      subnet_name     = "${local.subnet_02}"
      subnet_ip       = "10.10.20.0/24"
      subnet_region   = "${var.vpc_region}"
    },
    {
      subnet_name     = "${local.subnet_03}"
      subnet_ip       = "10.10.30.0/24"
      subnet_region   = "${var.vpc_region}"
    }
  ]
}


# module "computes" {
#   source = "../modules/gce"
#   project_name        = var.project_name
#   compute_type        = var.compute_type
#   compute_zone        = var.compute_zone
#   compute_image       = var.compute_image
#   network_name        = var.network_name

#   # selete name from vpc 
#   network_subenet     = "${local.subnet_01}"
# }