### Terraform which creates resource on Google Cloud Platform (GCP).

#### Prerequisites
- Terraform version
   - Terraform v0.12.20
   - provider.google v3.3.0
   - provider.null v2.1.2

- Gcloud version
   - Google Cloud SDK 290.0.0
   - beta 2019.05.17
   - bq 2.0.56
   - core 2020.04.21
   - gsutil 4.49

#### These types of resources are supported:
- Network
   - Virtual Network (VPC)
   - Subnets
   - Availability Zones
   - Internet Gateway

- Compute
   - Google Cloud Compute Engine (GCE)

#### Requirement

- Create Project
- Which services to enable API [How to Enabling API Services](https://support.google.com/googleapi/answer/6158841?hl=en)
   - Compute Engine API
- Gcloud installation [How to Install gcloud-cli](https://cloud.google.com/sdk/docs/install)
- Gcloud authentication

```
gcloud auth application-default login
```

#### Usage

- Custom values into file `./workspace/non-prod.tfvars`

```
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

```

#### Terraform Init

- Run terraform `init`, `apply`, `destroy` on root directory

```
terraform init
```

#### Terraform apply

- Create VPC Network

```
terraform apply -var-file="./workspace/non-prod.tfvars" -target="module.vpc"
```

- Create Compute Engine

```
terraform apply -var-file="./workspace/non-prod.tfvars" -target="module.gce"
```

#### Terraform destroy

- Delete for each resource that has provisioned

```
tf destroy -var-file="./workspace/non-prod.tfvars" -target="module.gce"
```

- Delete all of resources that has provisioned

```
terraform destroy -var-file="./workspace/non-prod.tfvars"
```

