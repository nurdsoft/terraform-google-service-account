output "service_account_email" {
  description = "The email address of the service account."
  value       = google_service_account.this.email
}

output "service_account_id" {
  description = "The fully-qualified name of the service account (projects/{project}/serviceAccounts/{email})."
  value       = google_service_account.this.id
}

output "service_account_name" {
  description = "The resource name of the service account."
  value       = google_service_account.this.name
}

output "service_account_key" {
  description = "The base64-encoded private key of the service account. Only populated when account_key = true."
  value       = var.account_key ? google_service_account_key.this[0].private_key : null
  sensitive   = true
}
