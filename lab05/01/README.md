

kubectl -n argo-events port-forward <event-source-pod-name> 12000:12000

curl -d '{"message":"this is my first webhook"}' -H "Content-Type: application/json" -X POST http://localhost:12000/example