#!/bin/bash

echo YANDEX CLOUD DESTROY

export YC_TOKEN=$(yc iam create-token)
export TF_VAR_cloud_id=$(yc config get cloud-id)
export TF_VAR_folder_id=$(yc config get folder-id)

cd ./infra

terraform destroy

cd ..