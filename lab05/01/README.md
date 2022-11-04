## Cluster-wide installation
- Create the namespace
```
kubectl create namespace argo-events
```

- Deploy Argo Events SA, ClusterRoles, and Controller for Sensor, EventBus, and EventSource
```
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install.yaml


# Install with a validating admission controller
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install-validating-webhook.yaml
```
- Port-forward argo-events
```
kubectl -n argo-events port-forward <event-source-pod-name> 12000:12000

curl -d '{"message":"this is my first webhook"}' -H "Content-Type: application/json" -X POST http://localhost:12000/example
```
- Deploy event-bus
kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/examples/eventbus/native.yaml

- Install Ingress-nginx
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install ingress nginx-stable/nginx-ingress
kubectl patch svc/ingress-nginx-ingress -n ingress-nginx -p '{"spec": {"type": "NodePort"}}'