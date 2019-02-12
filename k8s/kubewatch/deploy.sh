#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi


helm install stable/kubewatch --name kubewatch --namespace kubewatch -f values.yaml