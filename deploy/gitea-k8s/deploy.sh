#!/bin/bash
set -e

# Create namespace
kubectl create namespace gitea

# Apply storage configurations
kubectl apply -f storage/ -n gitea

# Apply deployments
kubectl apply -f deployments/ -n gitea

# Apply services and ingress
kubectl apply -f services/ -n gitea

# Wait for deployment
echo "Waiting for Gitea deployment..."
kubectl -n gitea wait --for=condition=available deployment/gitea --timeout=300s

echo "Gitea deployment completed!"
echo "Add 'gitea.local' to your /etc/hosts file pointing to your cluster IP"
echo "Access Gitea at http://gitea.local"
echo "Default admin account will be created on first access"