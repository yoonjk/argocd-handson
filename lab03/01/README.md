
# Install Argo Rollouts
kubectl create namespace argo-rollouts

kubectl apply -n argo-rollouts \
-f https://raw.githubusercontent.com/argoproj/argo-rollouts/stable/manifests/install.yaml

## nstall Argo Rollouts Kubectl plugin
Argo 롤아웃 Kubectl 플러그인을 사용하면 대시보드 UI 열기와 같은 kubectl CLI를 사용하여 롤아웃 특정 명령을 실행할 수 있습니다. 이렇게 하면 롤아웃과 더 쉽게 상호 작용할 수 있습니다.
```bash
curl -Lv https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-darwin-amd64 -o /usr/local/bin/kubectl-argo-rollouts

ls -al /usr/local/bin/kubectl-argo-rollouts
chmod +x /usr/local/bin/kubectl-argo-rollout
ls -al /usr/local/bin/kubectl-argo-rollouts

kubectl argo rollouts version
```

## Install nginx ingress
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo update

kubectl create namespace ingress-nginx

helm install -n ingress-nginx ingress-nginx ingress-nginx/ingress-nginx \
--set controller.metrics.enabled=true \
--set controller.metrics.serviceMonitor.enabled=true

helm upgrade --install ingress-nginx ingress-nginx \
--repo https://kubernetes.github.io/ingress-nginx \
--namespace ingress-nginx --create-namespace


kubectl patch svc rollouts-demo --patch \
'{"spec": { "type": "NodePort", "ports": [ { "nodePort": 31080, "port": 80, "protocol": "TCP", "targetPort": "http", "name": "http" } ] } }'


curl -Lo basic-rollout-blue.yaml https://raw.githubusercontent.com/argoproj/argo-rollouts/master/docs/getting-started/basic/rollout.yaml

curl -Lo basic-service.yaml https://raw.githubusercontent.com/argoproj/argo-rollouts/master/docs/getting-started/basic/service.yaml


## green => blue 
kubectl argo rollouts set image rollout-bluegreen  \
rollouts-demo=argoproj/rollouts-demo:blue

## rollout 시작
kubectl argo rollouts promote rollout-bluegreen

## watch
kubectl argo rollouts get rollout rollout-bluegreen -w

