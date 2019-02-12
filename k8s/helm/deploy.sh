#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

install() {
    if ! [ -x "$(command -v helm)" ]; then
        echo 'Error: helm is not installed.' >&2
        # Download and unpack helm
        echo 'Info: install helm.' >&2
        local dist
        dist="$(uname -s)"
        version=2.12.3
        # shellcheck disable=SC2021
        dist=$(echo "${dist}" | tr "[A-Z]" "[a-z]")
        wget "https://storage.googleapis.com/kubernetes-helm/helm-v${version}-${dist}-amd64.tar.gz"
        tar -zxvf "helm-v${version}-${dist}-amd64.tar.gz"
        sudo mv "${dist}-amd64/helm" /usr/local/bin/helm
    fi

    # init helm
    helm init

    # update helm repos
    helm repo update

    sleep 5

    helm_ready=$(kubectl get pods -l app=helm -n kube-system -o jsonpath='{.items[0].status.phase}')
    INC=0
    until [[ "${helm_ready}" == "Running" || $INC -gt 20 ]]; do
        echo "."
        sleep 10
        ((++INC))
        helm_ready=$(kubectl get pods -l app=helm -n kube-system -o jsonpath='{.items[0].status.phase}')
    done

    if [ "${helm_ready}" != "Running" ]; then
        echo "Helm init not successfully"
        exit 1
    fi

    echo "Helm init successful"

    # set up RBAC for helm
    kubectl -n kube-system create sa tiller
    kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
    kubectl -n kube-system patch deploy/tiller-deploy -p '{"spec": {"template": {"spec": {"serviceAccountName": "tiller"}}}}'

}

install