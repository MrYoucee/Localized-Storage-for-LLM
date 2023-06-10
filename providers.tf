provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "terraform-storage-789"
    prefix = "terraform/state"
  }
}