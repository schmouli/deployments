# Check if namespace exists
kubectl get namespace gitea


echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# View all resources in gitea namespace
kubectl get all -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check PVC status
kubectl get pvc -n gitea
kubectl describe pvc gitea-data-pvc -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check ConfigMaps
kubectl get configmaps -n gitea
kubectl describe configmap gitea-config -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check deployment status
kubectl get deployments -n gitea
kubectl describe deployment gitea -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check ReplicaSets
kubectl get rs -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Pod status and logs
kubectl get pods -n gitea
kubectl describe pod -l app=gitea -n gitea
kubectl logs -l app=gitea -n gitea --tail=100

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check deployment status
kubectl get deployments -n gitea
kubectl describe deployment gitea -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check ReplicaSets
kubectl get rs -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Pod status and logs
kubectl get pods -n gitea
kubectl describe pod -l app=gitea -n gitea
kubectl logs -l app=gitea -n gitea --tail=100

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check deployment status
kubectl get deployments -n gitea
kubectl describe deployment gitea -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check ReplicaSets
kubectl get rs -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Pod status and logs
kubectl get pods -n gitea
kubectl describe pod -l app=gitea -n gitea
kubectl logs -l app=gitea -n gitea --tail=100

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Service status
kubectl get svc -n gitea
kubectl describe svc gitea-svc -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Ingress status
kubectl get ingress -n gitea
kubectl describe ingress gitea-ingress -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Check Endpoints
kubectl get endpoints -n gitea

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."


# View events in namespace
kubectl get events -n gitea --sort-by='.lastTimestamp'

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."


# Check pod health
kubectl exec -it $(kubectl get pod -l app=gitea -n gitea -o jsonpath='{.items[0].metadata.name}') -n gitea -- wget -qO- localhost:3000/api/v1/health

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."


# Port-forward to test locally
kubectl port-forward svc/gitea-svc -n gitea 3000:80

echo "Starting process..."
sleep 3
echo "Resuming after 60 seconds."

# Test with curl (in another terminal)
curl -v http://localhost:3000

echo "Starting process..."
echo "Resuming after 60 seconds."
