#!/usr/bin/env bash

set -ex

if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG=~/.kube/config
fi

install() {
    if ! [ -x "$(command -v jx)" ]; then
        echo 'Error: jx is not installed.' >&2
        # Download and unpack jx
        echo 'Info: install jx.' >&2
        local dist
        dist="$(uname -s)"
        version=1.3.825
        # shellcheck disable=SC2021
        dist=$(echo "${dist}" | tr "[A-Z]" "[a-z]")
        curl -L "https://github.com/jenkins-x/jx/releases/download/v${version}/jx-${dist}-amd64.tar.gz" | tar xzv
        sudo mv jx /usr/local/bin

    fi

    # install jenkins x in k8s
    jx install 
    
}

install