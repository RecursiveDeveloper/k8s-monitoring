#!/bin/bash

GRAFANAPASS_PATH="/opt/monitoring/grafana_password.txt"

minikube delete

[ -e ${GRAFANAPASS_PATH} ] && rm -f ${GRAFANAPASS_PATH}
