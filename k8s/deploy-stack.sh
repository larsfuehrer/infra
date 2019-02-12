#!/usr/bin/env bash

set -ex

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# deploy helm
echo 'Info: deploy helm.' >&2
$scriptdir/helm/deploy.sh

# deploy nginx-ingress
echo 'Info: deploy nginx-ingress.' >&2
$scriptdir/nginx-ingress/deploy.sh

# deploy cert-manager
echo 'Info: deploy cert-manager.' >&2
$scriptdir/cert-manager/deploy.sh

# deploy kubed
#echo 'Info: deploy kubed.' >&2
#$scriptdir/kubed/deploy.sh

# deploy prometheus-operator
echo 'Info: deploy prometheus-operator.' >&2
$scriptdir/prometheus-operator/deploy.sh