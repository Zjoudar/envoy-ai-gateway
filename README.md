# envoy-ai-gateway

Troubleshooting Tips
Check Envoy logs:

bash
kubectl logs -n ai-gateway -l app=envoy-ai-gateway --tail=50
Verify secret exists:

bash
kubectl get secret -n ai-gateway deepseek-secret -o yaml
Test authentication independently:

bash
curl -X POST https://api.deepseek.com/v1/chat/completions \
  -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"deepseek-chat","messages":[{"role":"user","content":"Hello"}]}'
This setup gives you a complete, secure implementation with proper VSCode integration and production-grade authentication handling.

