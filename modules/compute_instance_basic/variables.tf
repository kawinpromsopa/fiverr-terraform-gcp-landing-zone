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
variable "project_name" {
  description = "project name "
}

variable "network_name" {
  description = "The name of the VPC network being created"
}

variable "compute_type" {
  description = "The name of the compute"
}

variable "compute_zone" {
  description = "zone of compute"
}

variable "compute_image" {
  description = "name of images like debian-cloud/debian-9"
}

variable "network_subenet" {
  description = "network subnet for compute"
}