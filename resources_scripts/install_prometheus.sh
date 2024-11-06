echo -e "\n--------------------------------------"
echo -e "Setting up Prometheus components"
echo -e "--------------------------------------\n"

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus \
    --namespace monitoring \
    -f ./resources_scripts/values.yaml

kubectl expose service prometheus-server --namespace monitoring \
    --type=NodePort \
    --target-port=9090 \
    --name=prometheus-server-ext
