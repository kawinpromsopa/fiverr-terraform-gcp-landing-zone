output "instances_self_links" {
  description = "List of self-links for compute instances"
  value       = google_compute_instance_from_template.default.*.self_link
}

output "available_zones" {
  description = "List of available zones in region"
  value       = data.google_compute_zones.default.names
}
