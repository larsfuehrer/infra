#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi


# add rook helm chart
helm repo add rook-stable https://charts.rook.io/stable

# install rook-operator
helm install rook-stable/rook-ceph --name rook-ceph --namespace rook-ceph-system