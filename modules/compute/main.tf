resource "google_compute_instance" "vm" {
  name         = var.instance_name
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  labels = var.labels
}
