echo -e "\n--------------------------------------"
echo -e "Initializing and setting up minikube cluster"
echo -e "--------------------------------------\n"
minikube start --nodes 2 \
    -p minikube \
    --extra-config=kubelet.housekeeping-interval=10s
minikube addons enable metrics-server
minikube update-context

kubectl create namespace monitoring

bash ./resources_scripts/install_prometheus.sh
bash ./resources_scripts/install_grafana.sh

echo -e "\n--------------------------------------"
echo -e "Waiting for resources to be up and running ......."
echo -e "--------------------------------------\n"
sleep 90

echo -e "\n--------------------------------------"
echo -e "Exposing services by Minikube Tunnel"
echo -e "--------------------------------------\n"
minikube service prometheus-server-ext grafana-ext -n monitoring
