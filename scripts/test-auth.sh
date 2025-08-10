#!/bin/bash

# Get gateway IP
GATEWAY_IP=$(kubectl get svc -n ai-gateway ai-gateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Test without auth (should fail)
echo "Testing without auth:"
curl -v http://$GATEWAY_IP/deepseek/health

# Test with auth
echo -e "\nTesting with auth:"
curl -v -H "Authorization: Bearer $DEEPSEEK_API_KEY" http://$GATEWAY_IP/deepseek/health