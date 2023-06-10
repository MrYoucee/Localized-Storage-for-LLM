# LOCALIZED-STORAGE-FOR-LLM
Automated workflow for creating K8s cluster, deploying Argo Workflow and storing git cloned images of a public LLM in a Google Cloud region.

- This automation was achieved by using Terraform for setting up the necessary Infrastructure on GCP and using Github actions to build the workflow actions.

# Prerequisities
      ## compulsory
- Create a GCP project_id and set it up as GCP_PROJECT_ID secret in Github actions at Settings > Secrets and variables > Actions 
- Create a service account keys with the permissions to create a k8s cluster (Basic permissions as 'Editor' or go for more refined and least privilege permissions) and add it as GCP_SA_KEY as above.
- Also set the preferred cluster name and region as GKE_CLUSTER_NAME and GKE_REGION respectively too. 
- Endeavour to create secondary IPv4 ranges in the default subnetwork of the default VPC Network. Give it the names as 'pods' and 'services'. 

      ## optional 
- Create your backend storage bucket in the project for the storage of your terraform state files. Update this name in the bucket of 'providers.tf' file. If you wish not to store this, delete the terraform block on 'providers.tf' file.
- Warning! It is highly recommended that you enable Object Versioning on the GCS bucket to allow for state recovery in the case of accidental deletions and human error.

# Terraform (.tf) files
- Update the values of your terraform.tfvars as appropriate.

# Running the process
Clone and checkout this repository to a branch, ensure your parameters are accurate. Immediately the pull-request is merged into main, the workflow is triggered and the process starts as 
- Infrastructure set-up using terraform (.tf) files
- Argo install and workflows using the workflow.yml file. The process involves git cloning the image and storing it in GCS.
- Clean-up by deleting the resources in the cluster and tearing down the cluster with the storage bucket created.

