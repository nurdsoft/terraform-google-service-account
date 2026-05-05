variable "project_id" {
  description = "The GCP project ID where the service account will be created."
  type        = string
}

variable "account_id" {
  description = "The account ID of the service account. Must be 6-30 characters, lowercase letters, numbers, and hyphens; must start with a letter."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.account_id))
    error_message = "account_id must be 6-30 characters, start with a lowercase letter, contain only lowercase letters, numbers, and hyphens, and not end with a hyphen."
  }
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
