module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "log-sink-sa"
  display_name = "Log sink service account for Cloud Run logs"
  description  = "Used by the Cloud Logging sink to write logs to a log bucket."

  roles = [
    "roles/logging.bucketWriter",
  ]

  labels = {
    env  = "production"
    team = "platform"
  }
}
