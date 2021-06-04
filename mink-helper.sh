#!/bin/bash

# We want context, namespace, secret.

function f() {
    test $2 = 'get' && echo password=`kubectl get secret $1 -ojson | jq -r .data.token | base64 -D | sha256sum | cut -d' ' -f 1`
}

f "$@"