#!/bin/bash

kubectl config set-cluster cluster --server "${PLUGIN_SERVER}"
kubectl config set-credentials cluster --token "${KUBETOKEN}"
kubectl config set-context cluster --cluster cluster --user cluster --namespace "${PLUGIN_NAMESPACE}"
kubectl config use-context cluster

kubectl apply -f *.yaml