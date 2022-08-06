terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region

  zone = var.zone
}

module "vpc" {
  source  = "app.terraform.io/luvveroenterprises/vpc/gcp"
  version = "1.0.0"
  network_name = var.network_name
  subnet_name = var.subnet_name
}