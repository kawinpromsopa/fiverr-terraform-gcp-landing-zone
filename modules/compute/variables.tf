variable "project_id" {
  description = "The GCP project to use for integration tests"
  type        = string
}

variable "region" {
  description = "The GCP region to create and test resources in"
  type        = string
  default     = "us-central1"
}

variable "subnetwork" {
  description = "The subnetwork selflink to host the compute instances in"
}

variable "instance_name" {
  type        = string
  description = "The name of instance."
}

variable "num_instances" {
  description = "Number of instances to create"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "subnetwork_project" {
  type = string
  default     = ""
}

variable "network_name" {
  type = string
  default     = ""
}

variable "machine_type" {
  description = "Machine type to create, e.g. n1-standard-1"
  default     = "n1-standard-1"
}

variable "tags" {
  type        = list(string)
  description = "Network tags, provided as a list"
  default     = []
}

variable "source_image_family" {
  description = "Source image family. If neither source_image nor source_image_family is specified, defaults to the latest public CentOS image."
  default     = "centos-7"
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  default     = "20"
}

# variable "service_account" {
#   default = null
#   type = object({
#     email  = string,
#     scopes = set(string)
#   })
#   description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
# }
