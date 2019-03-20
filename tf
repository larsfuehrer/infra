#!/usr/bin/env bash

#set -x

if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

while getopts e:c: option; do
    case "${option}"
    in
        e) ENV=${OPTARG};;
        c) COMMAND=${OPTARG};;
    esac
done

docker run -it --rm -v $(pwd)/terraform/$ENV:/$ENV/ -w /$ENV/ hashicorp/terraform:light $COMMAND