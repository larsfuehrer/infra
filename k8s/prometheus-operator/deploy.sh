#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

# install prometheus-operator helm chart
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring -f values.yaml