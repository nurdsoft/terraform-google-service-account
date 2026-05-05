# terraform-google-service-account

## Overview

This Terraform module provisions a GCP service account using `google_service_account` and optionally binds it to one or more project-level IAM roles using `google_project_iam_member`. It standardises service account provisioning and IAM binding across projects so that these resources do not need to be defined as inline raw resources in each project's deploy configuration.

## Usage

`Basic (no IAM bindings)`:

```hcl
module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "my-service-account"
  display_name = "My Service Account"
}
```

`With IAM role bindings`:

```hcl
module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "log-sink-sa"
  display_name = "Log sink service account for Cloud Run logs"
  description  = "Used by the Cloud Logging sink to write logs to a log bucket."

  roles = [
    "roles/logging.bucketWriter",
  ]
}
```

`Complete`:

```hcl
module "service_account" {
  source = "git::https://github.com/nurdsoft/terraform-google-service-account.git?ref=v1.0.0"

  project_id   = "my-gcp-project"
  account_id   = "log-sink-sa"
  display_name = "Log sink service account for Cloud Run logs"
  description  = "Used by the Cloud Logging sink to write logs to a log bucket."

  roles = [
    "roles/logging.bucketWriter",
    "roles/storage.objectCreator",
  ]
}
```

## Assumptions

- A basic understanding of [Git](https://git-scm.com/). Git version `>= 2.33.0`.
- An existing GCP IAM user or role with permission to create/update/delete `google_service_account` and `google_project_iam_member` resources.
- [GCloud CLI](https://cloud.google.com/sdk/docs/install) `>= 465.0.0`
- A basic understanding of [Terraform](https://www.terraform.io/). Terraform version `>= 1.3`.
- (Optional - for local testing) A basic understanding of [Make](https://www.gnu.org/software/make/manual/make.html#Introduction).
  - Make version `>= GNU Make 3.81`.
  - **Important Note**: This project includes a [Makefile](https://github.com/nurdsoft/terraform-google-service-account/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**.

## Test

```sh
gcloud init
gcloud auth application-default login
make plan COMP=basic
make apply COMP=basic
make destroy COMP=basic
```

## Contributions

Contributions are always welcome. As such, this project uses the `main` branch as the source of truth to track changes.

**Step 1**. Clone this project.

```sh
# Using Git
$ git clone git@github.com:nurdsoft/terraform-google-service-account.git

# Using HTTPS
$ git clone https://github.com/nurdsoft/terraform-google-service-account.git
```

**Step 2**. Checkout a feature branch: `git checkout -b feat/abc`.

**Step 3**. Validate the change/s locally by executing the steps defined under [Test](#test).

**Step 4**. If testing is successful, commit and push the new change/s to the remote.

```sh
$ git add file1 file2 ...

$ git commit -m "Adding some change"

$ git push --set-upstream origin feat/abc
```

**Step 5**. Once pushed, create a [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and assign it to a member for review.

- **Important Note**: It can be helpful to attach the `terraform plan` output in the PR.

**Step 6**. A team member reviews/approves/merges the change/s.

**Step 7**. Once merged, deploy the required changes as needed.

**Step 8**. Once deployed, verify that the changes have been deployed.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| google | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 6.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The GCP project ID where the service account will be created | `string` | n/a | yes |
| account\_id | The account ID of the service account | `string` | n/a | yes |
| display\_name | A human-readable name for the service account | `string` | `""` | no |
| description | A human-readable description of the service account | `string` | `""` | no |
| roles | List of IAM roles to bind to the service account at the project level | `list(string)` | `[]` | no |
| account\_key | Whether to create a service account key. The private key will be available in the `service_account_key` output and stored in Terraform state | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| service\_account\_email | The email address of the service account |
| service\_account\_id | The fully-qualified name of the service account (`projects/{project}/serviceAccounts/{email}`) |
| service\_account\_name | The resource name of the service account |
| service\_account\_key | The base64-encoded private key of the service account. Only populated when `account_key = true` |

## Authors

Module is maintained by [Nurdsoft](https://github.com/nurdsoft).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/nurdsoft/terraform-google-service-account/blob/main/LICENSE) for full details.
