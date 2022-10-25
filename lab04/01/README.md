Argo CD 이미지 업데이트는 응용 프로그램의 이미지를 업데이트하는 방법에 대한 두 가지 다른 방법을 지원합니다.
  - ARGO CD API를 통해 명령
  - 선언, git 저장소로 변경을 푸시

컨테이너 이미지를 업데이트하려는 응용 프로그램은 Argo CD를 사용하여 관리해야합니다
Argo CD 이미지 업데이터는 Kustomize 또는 Helm을 사용하여 매니페스트를 렌더링하는 응용 프로그램에 대해서만 컨테이너 이미지를 업데이트 할 수 있습니다. ).
image pull-secret은 Argo CD 이미지 업데이트가 실행중인 동일한 Kubernetes 클러스터에 존재해야합니다. 현재 다른 클러스터에서 이러한 비밀을 가져올 수는 없습니다.

1. Argo CD API를 직접 (명백히) 호출
이 방법은 Argo CD API를 직접 호출하여 작동합니다. 그런 다음 ARGO CD는 정의 된 동기화 정책에 따라 작업을 따를 수 있습니다. 이 방법은 유사성입니다. 클러스터에서 응용 프로그램 리소스를 삭제하고 다시 만들면 이미지 업데이트로 변경된 변경 사항이 사라집니다. GIT를 사용하여 애플리케이션 리소스를 관리하고 GIT에 저장된 버전이 클러스터의 리소스에 대해 동기화 된 경우에도 마찬가지입니다. 이 방법은 웹 UI 또는 CLI를 사용하는 것과 같은 응용 프로그램에도 가장 적합합니다.
2. git 저장소를 업데이트 (선언적으로)
이 메소드는 GIT를 사용하여 매개 변수 재정의를 영구적으로 저장하여 응용 프로그램의 리소스 매니페스트와 커밋 형태로 저장합니다. 이를 통해 GIT에서 매개 변수를 지속적으로 저장할 수 있습니다. 이는 동기 상태와 라이브 상태를 일관되게 볼 수있게하고 더 감사하기 쉽기 때문에 더 바람직한 방법입니다.

이미지 업데이트는 이미지 업데이트를보기 위해 컨테이너 레지스트리에 액세스해야합니다. 아래의  레지스트리가 지원됩니다.
  - Docker Hub Registry
  - Google Container Registry (gcr.io)
  - RedHat Quay Registry (quay.io)
  - GitHub Docker Packages (docker.pkg.github.com)
  - GitHub Container Registry (ghcr.io)
  - AWS ()
## Install and configure the ArgoCD Image Updater

kubectl apply -n argocd  \
  -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

# minikube setup
https://blog.argoproj.io/closing-ci-cd-loop-using-argoproj-a78a50a98fe8

Argo CD Image Updater는 Argo CD와 함께 작동하므로 Argo CD가 설치된 Kubernetes 클러스터가 필요합니다. 
이미 하나가 있다면 다음 단계로 자유롭게 이동하십시오
Minikube: https://kubernetes.io/docs/setup/
Argo CD: https://argoproj.github.io/argo-cd/getting_started/




## log level 수정

```bash
kubectl edit configmap argocd-image-updater-config -n argocd

apiVersion: v1
kind: ConfigMap
data:
  # log.level can be one of trace, debug, info, warn or error
  log.level: debug
```
## tag nginx
docker tag nginx:latest nexweb1/nginx:0.0.1

argoCD Image Updater 설정
kubectl annotate app sample -n argocd \
    argocd-image-updater.argoproj.io/image-list=docker.io/nexweb1/hello \
    argocd-image-updater.argoproj.io/my-image.update-strategy=latest





## 참고
https://argocd-image-updater.readthedocs.io/en/stable/basics/update-methods/



