#!/bin/bash
source ../.env

# Test DeepSeek egress
echo "Testing DeepSeek..."
curl -s -x http://localhost:8443 http://deepseek/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
  -d '{"model":"deepseek-chat","messages":[{"role":"user","content":"Hello"}]}'

# Test internal MCP ingress
echo -e "\nTesting internal MCP..."
curl -s -H "Authorization: Bearer $INTERNAL_JWT" \
  http://localhost:8080/mcp/predict \
  -d '{"model":"test","input":"sample"}'

# Test rate limiting
echo -e "\nTesting rate limits..."
for i in {1..5}; do
  curl -s -H "Authorization: Bearer $INTERNAL_JWT" \
    http://localhost:8080/mcp/predict | jq .message -r
done