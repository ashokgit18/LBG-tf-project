resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.location

  enable_autopilot    = true
  deletion_protection = false

  network    = var.network
  subnetwork = var.subnetwork

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}
}
