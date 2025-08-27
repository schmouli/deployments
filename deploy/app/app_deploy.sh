#!/bin/bash
set -e

# Apply deployments
echo "Applying deployments..."
kubectl apply -f deployments/

# Apply services
echo "Applying services..."
kubectl apply -f services/

# Wait for deployments to be ready
echo "Waiting for deployments..."
kubectl wait --for=condition=available deployment/fastapi-deploy --timeout=120s
kubectl wait --for=condition=available deployment/chatbot-deploy --timeout=120s

# Add hosts entries if not present
if ! grep -q "fastapi.local" /etc/hosts; then
    echo "127.0.0.1 fastapi.local chatbot.local" | sudo tee -a /etc/hosts
fi

echo "Deployment complete!"
echo "Access services at:"
echo "  http://fastapi.local:8080"
echo "  http://chatbot.local:8080"