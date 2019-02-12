#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

# install nginx-ingress helm chart
helm install stable/nginx-ingress --name nginx-ingress --namespace nginx-ingress -f values.yaml