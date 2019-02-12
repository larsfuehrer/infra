#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi


helm install stable/helm-exporter --name helm-exporter --namespace helm-exporter