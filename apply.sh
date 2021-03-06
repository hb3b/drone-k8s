#!/bin/bash

ENV_VAR_KEY_ARRAY=()

for var in "E${!DRONE_@}"; do
    ENV_VAR_KEY_ARRAY+=("\${$var}")
done

ENV_VAR_KEYS=$(IFS=" "; echo "${ENV_VAR_KEY_ARRAY[*]}")

for filename in *.yaml; do
    envsubst "$ENV_VAR_KEYS" < $filename > $filename.tmp
    mv "$filename.tmp" "$filename"
done

kubectl config set-credentials cluster --token "${PLUGIN_KUBETOKEN}"
kubectl config set-cluster cluster --server "${PLUGIN_SERVER}"
kubectl config set-context cluster --cluster cluster --user cluster --namespace "${PLUGIN_NAMESPACE}"
kubectl config use-context cluster
kubectl config view

cat *.yaml | kubectl apply -f -
