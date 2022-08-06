resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "terraform-network-subnets" {
  count         = var.vpc_subnet_count
  name          = "terraform-network-subnet-${count.index}"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = cidrsubnet(var.vpc_cidr_block, 8, count.index)
}

##################################################################################
# Firewall Rules
##################################################################################
# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "fw-allow-http"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# Allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "fw-allow-ssh"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# Allow IAP
resource "google_compute_firewall" "allow-iap" {
  name    = "fw-allow-iap"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap"]
}

# Allow ssh
resource "google_compute_firewall" "allow-health-checks" {
  name    = "fw-allow-health-checks"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["allow-health-checks"]
}