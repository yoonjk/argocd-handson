
## Install and configure the ArgoCD Image Updater

kubectl apply -n argocd  \
  -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

# minikube setup
https://blog.argoproj.io/closing-ci-cd-loop-using-argoproj-a78a50a98fe8

Argo CD Image Updater는 Argo CD와 함께 작동하므로 Argo CD가 설치된 Kubernetes 클러스터가 필요합니다. 
이미 하나가 있다면 다음 단계로 자유롭게 이동하십시오
Minikube: https://kubernetes.io/docs/setup/
Argo CD: https://argoproj.github.io/argo-cd/getting_started/


## User 추가 
```bash
kubectl edit cm  argocd-cm -n argocd

apiVersion: v1
kind: ConfigMap
data:
  # api 접근 용도로만 사용할꺼기 때문에 apiKey 만 적어준다
  accounts.image-updater: apiKey
```

## log level 수정

```bash
kubectl edit configmap argocd-image-updater-config -n argocd

apiVersion: v1
kind: ConfigMap
data:
  # log.level can be one of trace, debug, info, warn or error
  log.level: debug
```
docker tag nginx:latest nexweb1/nginx:0.0.1

argoCD Image Updater 설정
kubectl annotate app sample -n argocd \
    argocd-image-updater.argoproj.io/image-list=docker.io/nexweb1/hello \
    argocd-image-updater.argoproj.io/my-image.update-strategy=latest
application.argoproj.io/sample annotated


## 계정권한 설정
```bash
kubectl edit configmap argocd-rbac-cm -n argocd
apiVersion: v1
kind: ConfigMap
data:
  policy.csv: |
    p, role:image-updater, applications, get, */*, allow
    p, role:image-updater, applications, update, */*, allow
    g, image-updater, role:image-updater
  policy.default: role.readonly
```

## 참고
https://argocd-image-updater.readthedocs.io/en/stable/basics/update-methods/


kubectl edit configmap argocd-image-updater-config -n argocd
apiVersion: v1
data:
  applications_api: argocd
  argocd.grpc_web: "true"
  argocd.insecure: "false"
  argocd.plaintext: "false"
  argocd.server_addr: <argocd 접속 주소>
kind: ConfigMap

## secret 생성 
kubectl create secret docker-registry github-creds \
--docker-server=ht
--docker-username=username
--docker-password=
-n argocd

## Argo CD Access Token Secret 생성

argocd account generate-token --account user00 --id user00

kubectl create secret generic argocd-image-updater-secret \
--from-literal argocd.token=$TOKEN --dry-run -o yaml | \
kubectl -n argocd apply -f -