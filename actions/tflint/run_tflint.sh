#!/bin/bash

set -eo pipefail

if [ $# -ne 2 ]
  then
    echo "2 arguments must be supplied!"
    exit 1
fi

DIRECTORY_TO_LINT=$1
CONFIG_PATH=$2

pushd "$DIRECTORY_TO_LINT"
terraform init
tflint -c "$CONFIG_PATH" .
popd