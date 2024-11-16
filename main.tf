terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.53.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
}
  

module "compute-engine" {
  source = "./modules/instances"
}

module "storage-bucket" {
  source = "./modules/storage"
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-414944"
    prefix  = "terraform/state"
  }
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "6.0.0"

    project_id   = var.project_id
    network_name = "tf-vpc-760726"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-east4"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-east4"
        }
    ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
 network = "projects/qwiklabs-gcp-03-dfe3a8005674/global/networks/tf-vpc-760726"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}