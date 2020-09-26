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

- Need to loing for run terraform by using gcloud auth as instructions for install just follow [link](https://cloud.google.com/sdk/docs/install)
   
- After install when need to run terrafrom

```
gcloud auth application-default login
```

#### Usage

- ./workspace/non-prod.tfvars

```
### vpc-network-setting
project_id    = "tfgcp-290508"
network_name  = "phase-one"
project_name  = "phase-one"
vpc_region    = "us-west1"


### compute setting 
project_id    = ""
subnetwork    = ""
region        = ""
num_instances = 1
subnetwork_project= ""
```

#### Terraform Init

```
terraform init 
```

#### Terraform apply

```
terraform apply -var-file="./workspace/non-prod.tfvars"
```

#### Terraform destroy

```
terraform destroy -var-file="./workspace/non-prod.tfvars"
```
