/**
 * Copyright 2019 Google LLC
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

## Instances in network

resource "google_compute_instance" "compute" {
  name         = "${var.project_name}-compute"
  machine_type = var.compute_type
  zone         = var.compute_zone

  //tags = ["debian"]

  boot_disk {
    initialize_params {
      image = var.compute_image
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network_name
    // select above network
    subnetwork = var.network_subenet
    access_config {}
  }

  service_account {
    scopes = ["compute-ro", "storage-ro"]
  }
}

#basic firewall rule for ssh

resource "google_compute_firewall" "firewall" {
  name    = "${var.project_name}-firewall"
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