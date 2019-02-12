#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

# install CRDs for cert-manager
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml

# install cert-manager helm chart
helm install stable/cert-manager --name cert-manager --namespace cert-manager

sleep 15

# deploy issuers
kubectl create -f staging-issuer.yaml
kubectl create -f prod-issuer.yaml
#kubectl create -f fuehrer_me_tls.yaml

# sync fuehrer-me-tls secret via kubed to all namespaces
#kubectl annotate secret fuehrer-me-tls -n cert-manager kubed.appscode.com/sync="app=kubed"