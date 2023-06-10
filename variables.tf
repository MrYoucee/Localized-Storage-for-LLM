variable "project_id" {
  type        = string
  description = "The Google Cloud Project Id"
}

variable "region" {
  type    = string
  description = "The default region for our Project" 
}

variable "gke_cluster_name" {
  type        = string
  description = "The name of the GKE Cluster"
}

variable "ip_range_pods" {
  type        = string
  description = "The name of the IP ranges for pods"
}

variable "ip_range_services" {
  type        = string
  description = "The name of the IP ranges for services"
}
