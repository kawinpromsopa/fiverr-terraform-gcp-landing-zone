# vpc network
project_id    = "temporary-290812"
project_name  = "temporary"
network_name  = "temporary-network"
vpc_region    = "asia-southeast1"

subnets = [
  {
    subnet_name           = "temporary-subnet-01"
    subnet_ip             = "10.10.10.0/24"
    subnet_region         = "asia-southeast1"
  },
  {
    subnet_name           = "temporary-subnet-02"
    subnet_ip             = "10.10.20.0/24"
    subnet_region         = "asia-southeast1"
    subnet_private_access = "true"
  },
  {
    subnet_name           = "temporary-subnet-03"
    subnet_ip             = "10.10.30.0/24"
    subnet_region         = "asia-southeast1"
    subnet_private_access = "true"
  }
]

# google cloud compute
subnetwork_project  = "temporary-290812"
subnetwork          = "temporary-subnet-01"
region              = "asia-southeast1"
instance_name       = "temporary"
num_instances       = 1
machine_type        = "n1-standard-1"
source_image_family = "ubuntu-1804-lts"
disk_size_gb        = "20"
