# LOCALIZED-STORAGE-FOR-LLM
Automated set-up for creating K8s cluster, deploying Argo Workflow and storing artifacts of a public LLM in a Google Cloud region

# Prerequisities
      ## compulsory
- Create a GCP project_id and set it up as GCP_PROJECT_ID secret in Github actions at Settings > Secrets and variables > Actions 
- Create a service account keys with the permissions to create a k8s cluster (Basic permissions as 'Editor' or go for more refined and least privilege permissions) and add it as GCP_SA_KEY as above.
- Also set the preferred cluster name and region as GKE_CLUSTER_NAME and GKE_REGION respectively too. 
- Create your backend storage bucket in the project for the storage of your terraform state files. Update this name in the bucket of 'providers.tf' file
      Warning! It is highly recommended that you enable Object Versioning on the GCS bucket to allow for state recovery in the case of accidental deletions and human error.
- Endeavour to create secondary IPv4 ranges in the default subnetwork of the default VPC Network. Give it the names as 'pods' and 'services'. 
- 
      ## optional
