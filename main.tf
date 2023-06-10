# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.gke_cluster_name
  region                     = var.region
  zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
  network                    = "default"
  subnetwork                 = "default"
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  horizontal_pod_autoscaling = true

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-medium"  #a2-ultragpu-1g (GPU for compute intensive ML task)
      node_locations            = "us-central1-b,us-central1-c"
      min_count                 = 1
      max_count                 = 3
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      create_service_account    = true
      initial_node_count        = 1
    },
  ]
}

resource "google_storage_bucket" "llm_bucket" {
  name          = "llm_bucket_789"
  location      = var.region
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}