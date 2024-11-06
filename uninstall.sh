minikube delete

helm repo remove prometheus-community grafana

[ -e "grafana_password.txt" ] && rm "grafana_password.txt"
