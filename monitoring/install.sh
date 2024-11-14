#!/bin/bash

sync_folder=$1
NAMESPACE="monitoring"

echo -e "\n--------------------------------------"
echo -e "Setting up minikube namespace"
echo -e "--------------------------------------\n"
kubectl create namespace $NAMESPACE

bash ${sync_folder}/resources_scripts/install_prometheus.sh $NAMESPACE $sync_folder
bash ${sync_folder}/resources_scripts/install_grafana.sh $NAMESPACE $sync_folder

echo -e "\n--------------------------------------"
echo -e "Waiting for resources to be up and running ......."
echo -e "--------------------------------------\n"
sleep 150

echo -e "\n--------------------------------------"
echo -e "Port-forwarding services"
echo -e "--------------------------------------\n"
kubectl port-forward --address 0.0.0.0 -n $NAMESPACE service/grafana 30007:80 & \
kubectl port-forward --address 0.0.0.0 -n $NAMESPACE service/prometheus-server 31007:80 &
