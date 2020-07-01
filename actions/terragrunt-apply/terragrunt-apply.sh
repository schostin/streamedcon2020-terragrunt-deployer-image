#!/bin/bash

set -eo pipefail

if [ $# -ne 2 ]
  then
    echo "2 arguments must be supplied!"
    exit 1
fi

GOOGLE_CLOUD_CREDENTIALS_CONTENT=$1
TERRAGRUNT_SUBFOLDER=$2

activate_gcloud_credentials.sh "$GOOGLE_CLOUD_CREDENTIALS_CONTENT"

pushd "$TERRAGRUNT_SUBFOLDER"
# Note: Normally never run auto-apply.
terragrunt apply -auto-approve
popd