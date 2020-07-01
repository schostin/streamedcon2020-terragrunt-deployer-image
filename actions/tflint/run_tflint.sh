#!/bin/bash

set -eo pipefail

DIRECTORY_TO_LINT=$1

pushd "$DIRECTORY_TO_LINT"
terraform init
tflint .
popd