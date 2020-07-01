#!/bin/bash

set -eo pipefail

DIRECTORY_TO_LINT=$1
CONFIG_PATH=$2

pushd "$DIRECTORY_TO_LINT"
terraform init
tflint -c "$CONFIG_PATH" .
popd