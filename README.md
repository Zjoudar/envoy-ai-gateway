# envoy-ai-gateway

#!/bin/bash

# Build and push Docker image
docker build -t your-docker-repo/api-gateway:latest .
docker push your-docker-repo/api-gateway:latest

# Deploy to Kubernetes
kubectl create namespace gateway-system
kubectl apply -f deployment.yaml

# Set up TLS (assuming cert-manager is installed)
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml
kubectl apply -f tls-issuer.yaml

# Install observability stack
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm install jaeger jaegertracing/jaeger -n monitoring

# Verify deployment
kubectl get all -n gateway-system

