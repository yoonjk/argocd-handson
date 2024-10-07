

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

#### install istio - optional

- [Download the Istio release](https://istio.io/latest/docs/setup/additional-setup/download-istio-release/)

[Istio 릴리스 페이지](https://github.com/istio/istio/releases/tag/1.23.2)로 이동하여 사용 중인 OS용 설치 파일을 다운로드하거나 최신 릴리스를 자동으로 다운로드하여 압축을 풀어줍니다.(Linux 또는 macOS):


> 위의 명령은 Istio의 최신 릴리스(숫자)를 다운로드합니다. 
> 명령줄에 변수를 전달하여 특정 버전을 다운로드하거나 프로세서 아키텍처를 재정의할 수 있습니다. 
> 예를 들어 x86_64 아키텍처용 Istio 1.23.2를 다운로드하려면 다음과 같이 실행합니다:
>

```bash
curl -L https://istio.io/downloadIstio | sh -
```

- Istio 패키지 디렉토리로 이동합니다. 예를 들어 패키지가 istio-1.23.2인 경우


설치 디렉터리에는 다음이 포함됩니다:  
>> - samples/ 디렉터리의 샘플 애플리케이션
>> - bin/ 디렉터리의 istioctl 클라이언트 바이너리.

- 경로(path)에 istioctl 클라이언트를 추가합니다(Linux 또는 macOS):


vi ~/.bash_profile 에 istio-1.23.2/bin을 path에 추가합니다.
```bash
export ISTIO_HOME=$HOME/istio-1.23.2
export PATH=$PATH:$ISTIO_HOME/bin
```

.bash_profile 을 다시 적용합니다.
```bash
source ~/.bash_profile
```