

이미지 업데이트가 한 일은 다음과 같습니다
  - 레지스트리에서 새 이미지 태그 업데이트를 감지
  - 저장소를 클로닝
  - 매니페스트 파일에서 이미지 업데이트를 생성
  - 저장소에 지정한 브랜치로 커밋후 다시 push
이미지 태그도 확인하면 

kubectl describe deploy my-app -n my-namespace | grep Image 

## secret 생성후
kubectl create secret generic github-credentials \
--from-literal username=username
--from-literal password=my personal access token
-n argocd

## Setup my application
kubectl edit app myapp -n argo

kubectl annotate app user00-nginx -n argocd \
    argocd-image-updater.argoproj.io/git-branch=image-updater \
    argocd-image-updater.argoproj.io/write-back-method=git:secret:argocd/github-credentials
