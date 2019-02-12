#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

# install kubed helm chart
helm repo add appscode https://charts.appscode.com/stable/
helm repo update
helm install appscode/kubed --name kubed --namespace kubed -f values.yaml