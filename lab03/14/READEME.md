GATEWAY_URL=$(minikube ip)

for i in `seq 1 1000`; do curl -H "host: canary-demo.com" -H "X-Canary:  true" $GATEWAY_URL/success; echo ""; sleep 1; done