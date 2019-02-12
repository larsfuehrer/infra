#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

kubectl create namespace hello
#kubectl label namespace demo1 app=kubed
kubectl apply -f hello.yaml