# Streamedcon Terragrunt Deployer Image

A docker image with common needed tools to deploy to GCP. Terragrunt, GCloud-cli and others are included.

## Installed Tools

* [GCloud-CLI](https://cloud.google.com/sdk/gcloud) with alpha and beta components (current version can be found in the Dockerfile).
* [TFLint](https://github.com/terraform-linters/tflint) (current version can be found in the Dockerfile).
* [Terraform](https://github.com/hashicorp/terraform) (current version can be found in the Dockerfile).
* [Terragrunt](https://github.com/gruntwork-io/terragrunt) (current version can be found in the Dockerfile).

## Usage

## Developing Tools

### Hadolint

I am using [Hadolint](https://github.com/hadolint/hadolint) in version `v1.18.0` for basic linting of the Dockerfile.
When running with Docker, hadolint can simply be used by running `docker run --rm -i hadolint/hadolint:v1.18.0-alpine < Dockerfile`
