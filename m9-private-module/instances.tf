resource "google_compute_instance" "tf-instance-1" {
  depends_on = [var.subnet_name]
  name         = "tf-instance-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  metadata_startup_script   = <<-EOT
        #!/bin/bash
            EOT
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name

  }
}