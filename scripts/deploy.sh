#!/bin/bash

# Create namespace
kubectl create ns ai-gateway || true

# Create secret (update with your actual key)
kubectl create secret generic deepseek-secret \
  --namespace ai-gateway \
  --from-literal=api-key=${DEEPSEEK_API_KEY} \
  --dry-run=client -o yaml | kubectl apply -f -

# Apply configurations
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/backend-config.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml