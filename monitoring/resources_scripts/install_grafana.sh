#!/bin/bash

namespace=$1
sync_folder=$2

echo -e "\n--------------------------------------"
echo -e "Setting up Grafana components"
echo -e "--------------------------------------\n"

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install grafana grafana/grafana --namespace $namespace

BASE64_PASS=$(kubectl get secret -n $namespace grafana -o jsonpath="{.data.admin-password}" | base64 --decode)
echo $BASE64_PASS > "${sync_folder}/grafana_password.txt"
