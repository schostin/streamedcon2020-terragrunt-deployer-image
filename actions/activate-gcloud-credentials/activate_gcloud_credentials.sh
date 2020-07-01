#!/bin/bash

set -eo pipefail

if [ $# -ne 1 ]
  then
    echo "1 argument must be supplied!"
    exit 1
fi

GOOGLE_CLOUD_CREDENTIALS_CONTENT=$1
echo $GOOGLE_CLOUD_CREDENTIALS_CONTENT > "$GOOGLE_APPLICATION_CREDENTIALS"
echo $GOOGLE_APPLICATION_CREDENTIALS
gcloud auth activate-service-account --key-file "$GOOGLE_APPLICATION_CREDENTIALS"