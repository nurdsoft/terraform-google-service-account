variable "project_id" {
  description = "The GCP project ID where the service account will be created."
  type        = string
}

variable "account_id" {
  description = "The account ID of the service account."
  type        = string
}

variable "display_name" {
  description = "A human-readable name for the service account."
  type        = string
  default     = ""
}

variable "description" {
  description = "A human-readable description of the service account."
  type        = string
  default     = ""
}

variable "roles" {
  description = "List of IAM roles to bind to the service account at the project level (e.g. [\"roles/logging.bucketWriter\"])."
  type        = list(string)
  default     = []
}

variable "account_key" {
  description = "Whether to create a service account key. The private key will be available in the service_account_key output and stored in Terraform state."
  type        = bool
  default     = false
}
