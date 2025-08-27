sudo snap install helm --classic

helm version

# Add the ingress-nginx repository
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Update helm repositories
helm repo update

# Install ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=NodePort

# Check ingress-nginx namespace
kubectl get namespace ingress-nginx

# Check pods in ingress-nginx namespace
kubectl get pods -n ingress-nginx -w

# Check services
kubectl get svc -n ingress-nginx