resource "google_compute_instance" "vm_instances" {
  count        = var.instance_count
  name         = "terraform-instance${count.index}"
  machine_type = "n1-standard-1"
  tags         = ["allow-health-checks", "ssh", "iap", "http"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"

    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.terraform-network-subnets[(count.index % var.vpc_subnet_count)].self_link
    access_config {
    }
  }
}