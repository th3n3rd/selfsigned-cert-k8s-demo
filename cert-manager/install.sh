#!/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo update

helm status cert-manager -n cert-manager || helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1 \
  --set prometheus.enabled=false \
  --set installCRDs=true \
  --wait

kubectl apply -f self-signed-issuer.yaml
