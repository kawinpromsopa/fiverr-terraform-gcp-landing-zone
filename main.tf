module "vpc" {
  source       = "./modules/vpc-network"
  project_id   = var.project_id
  network_name = var.network_name
  subnets      = var.subnets
}

module "gce" {
  source          = "./modules/compute"
  project_id      = var.project_id
  region          = var.region
  subnetwork          = var.subnetwork
  subnetwork_project  = var.subnetwork_project
  instance_name       = var.instance_name
  num_instances       = var.num_instances
  machine_type        = var.machine_type
  source_image_family = var.source_image_family
  disk_size_gb        = var.disk_size_gb
}
