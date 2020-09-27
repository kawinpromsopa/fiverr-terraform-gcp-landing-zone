/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

provider "google" {
  version = "~> 3.3.0"
  project     = var.project_id
  region      = var.region
}

## https://www.terraform.io/docs/providers/google/r/compute_address.html

resource "google_compute_address" "static" {
  project = var.project_id
  name = "ipv4-address"
}

module "instance_template" {
  source          = "../modules/instance_template"
  region          = var.region
  project_id      = var.project_id
  subnetwork      = var.subnetwork
  subnetwork_project = var.subnetwork_project
  # service_account = var.service_account
}

module "compute_instance" {
  source            = "../modules/compute_instance"
  region            = var.region
  subnetwork        = var.subnetwork
  num_instances     = var.num_instances

  hostname          = "instance-simple"
  subnetwork_project = var.subnetwork_project
  instance_template = module.instance_template.self_link
  access_config = [{
    nat_ip       = google_compute_address.static.address
    network_tier = var.network_tier
  }, ]
}

## Allow SSH
resource "google_compute_firewall" "firewall-ssh" {
  name    = "firewall-${var.project_id}"
  network = var.network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
