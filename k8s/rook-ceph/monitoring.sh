#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

version=0.9

kubectl create -f https://raw.githubusercontent.com/rook/rook/release-${version}/cluster/examples/kubernetes/ceph/monitoring/prometheus-service.yaml
kubectl create -f https://raw.githubusercontent.com/rook/rook/release-${version}/cluster/examples/kubernetes/ceph/monitoring/prometheus.yaml
kubectl create -f https://raw.githubusercontent.com/rook/rook/release-${version}/cluster/examples/kubernetes/ceph/monitoring/service-monitor.yaml