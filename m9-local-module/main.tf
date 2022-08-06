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
  source       = "./modules/vpc"
  network_name = var.network_name
  subnet_name = var.subnet_name
}