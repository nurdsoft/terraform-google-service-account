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
