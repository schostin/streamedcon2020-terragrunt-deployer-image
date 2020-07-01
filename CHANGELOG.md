# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v1.0.1] - 2020-97-01

### Fixed

* reference the expected tag for docker images.

## [v1.0.0] - 2020-07-01

This release contains the first version of this Dockerfile with basic tooling:

### Added

* TFLint in version `v0.17.0`
* Terraform in version `v0.12.28`
* Terragrunt in version `v0.23.31`
* GCloud-CLI in version `299.0.0`
* Github action for running tflint.
* Github action to validate gcloud connection.
* Github action for terragrunt plan.
* Github action for terragrunt apply.
