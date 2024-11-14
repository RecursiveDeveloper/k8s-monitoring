#!/bin/bash

namespace=$1
sync_folder=$2

echo -e "\n--------------------------------------"
echo -e "Setting up Prometheus components"
echo -e "--------------------------------------\n"

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus \
    --namespace $namespace \
    -f ${sync_folder}/resources_scripts/values.yaml
