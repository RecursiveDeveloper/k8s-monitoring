echo -e "\n--------------------------------------"
echo -e "Setting up Grafana components"
echo -e "--------------------------------------\n"

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install grafana grafana/grafana --namespace monitoring

BASE64_PASS=$(kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode)
echo $BASE64_PASS > "grafana_password.txt"

kubectl expose service grafana --namespace monitoring \
    --type=NodePort \
    --target-port=3000 \
    --name=grafana-ext
