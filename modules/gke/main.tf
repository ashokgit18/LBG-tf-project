resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.location

  network    = var.network
  subnetwork = var.subnetwork

  networking_mode = "VPC_NATIVE"

  deletion_protection      = false
  initial_node_count       = 1
  remove_default_node_pool = true

  node_locations = ["us-central1-c"]

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    disk_type    = "pd-standard"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "application" {
  name     = "${var.cluster_name}-app-pool"
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_locations = ["us-central1-c"]

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    disk_type    = "pd-standard"

    labels = {
      workload = "application"
    }
  }
}

resource "google_container_node_pool" "batch" {
  name     = "${var.cluster_name}-batch-pool"
  location = var.location
  cluster  = google_container_cluster.cluster.name

  node_locations = ["us-central1-c"]

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    disk_type    = "pd-standard"

    labels = {
      workload = "batch"
    }

    taint {
      key    = "dedicated"
      value  = "batch"
      effect = "NO_SCHEDULE"
    }
  }
}
