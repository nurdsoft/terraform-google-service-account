module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "my-service-account"
  display_name = "My Service Account"
}
