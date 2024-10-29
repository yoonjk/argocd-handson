
curl -L https://istio.io/downloadIstio | sh - 

cd istio-1.23.2

vi ~/.bash_profile 

export ISTIO_HOME=$HOME/istio-1.23.2
export PATH=$PATH:$ISTIO_HOME/bin


source  ~/.bash_profile

istioctl install

kubectl get pods -n istio-system


kubectl label namespace default istio-injection=enabled

kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
{ kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.1.0" | kubectl apply -f -; }


kubectl run curl --image=alpine/curl:8.2.1 -n kube-system -i --tty -- sh
curl -h
exit

kubectl exec -it curl -n kube-system -- sh

curl -s productpage.default:9080/productpage | grep -o "<title>.*</title>"


kubectl apply -f samples/bookinfo/gateway-api/bookinfo-gateway.yaml

export INGRESS_HOST=$(kubectl get gtw bookinfo-gateway -o jsonpath='{.status.addresses[0].value}')

export INGRESS_PORT=$(kubectl get gtw bookinfo-gateway -o jsonpath='{.spec.listeners[?(@.name=="http")].port}')

export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

kubectl get svc 

echo $GATEWAY_URL

curl -s "http://${GATEWAY_URL}/productpage" | grep -o "<title>.*</title>"


for i in `seq 1 10000`
do
curl -s "http://${GATEWAY_URL}/productpage" | grep -o "<title>.*</title>"
sleep 1
done


istioctl dashboard kiali --address 0.0.0.0

