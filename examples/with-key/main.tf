module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "firebase-admin-sa"
  display_name = "Firebase Admin service account"
  description  = "Service account for Firebase Admin SDK access."

  roles = [
    "roles/firebase.admin",
  ]

  account_key = true
}
