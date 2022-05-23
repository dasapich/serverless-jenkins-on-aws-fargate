#!/usr/bin/env bash
set -e

source vars.sh

terraform init \
    -backend=true \
    -backend-config key="${TF_STATE_OBJECT_KEY}" \
    -backend-config bucket="${TF_STATE_BUCKET}" \
    -backend-config dynamodb_table="${TF_LOCK_DB}"

terraform destroy \
    -auto-approve=true
