#!/bin/bash

set -eo pipefail

DIRECTORY_TO_LINT=$1
CURRENT_DIRECTORY=$(pwd)

pushd "$DIRECTORY_TO_LINT"
terraform init
tflint -c "$CURRENT_DIRECTORY/.tflint.hcl".
popd