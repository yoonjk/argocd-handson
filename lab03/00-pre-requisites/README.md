

## minikube 

```bash
minikube start --memory=8192mb --cpus=4 --force
minikube addons enable metrics-server
```



#### NGINX Ingress Controller Setup


다음 지침은 미니큐브에서 NGINX 인그레스 컨트롤러를 구성하는 방법을 설명합니다. 기본 인그레스 지원을 위해서는 “인그레스” 애드온만 활성화하면 됩니다:

```bash
minikube addons enable ingress
kubectl get deploy -n ingress-nginx
```

#### Install Argo Rollouts
```bash
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

#### Download Argo Rollouts Plugin
[Argo Rollouts Plugin Download](https://github.com/argoproj/argo-rollouts/releases)

```bash
wget https://github.com/argoproj/argo-rollouts/releases/download/v1.7.2/kubectl-argo-rollouts-linux-amd64
```

kubectl-argo-rollouts 실행모드로 변경
```bash
chmod +x ./kubectl-argo-rollouts-darwin-amd64
```

/usr/local/bin 으로 이동
```bash
mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
# check
ls -al /usr/local/bin/kubectl-argo-rollouts
```