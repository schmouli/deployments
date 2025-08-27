#!/bin/bash
set -e

# Start local registry
docker run -d --restart=always -p 5001:5000 --name kind-registry registry:2 || true

# Attach registry to kind network if needed
docker network connect kind kind-registry || true

#Create cluster
kind create cluster --config kind-config.yaml

#install ingress controller
./install_ingress.sh