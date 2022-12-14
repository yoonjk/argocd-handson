## Argo CD Server Login
argocd login localhost:8080 --username admin --password $ARGOCD_SERVER_PASSWD --insecure

## Argo CD account update password
argocd account update-password --account user00
argocd login localhost:8080 --username user00 --password $ARGOCD_PASSWORD --insecure

## User 추가 
```bash
kubectl patch cm argocd-cm -n argocd --type merge -p '{"data": {"accounts.user01": "apiKey,login"}}'

or

kubectl edit cm  argocd-cm -n argocd

apiVersion: v1
kind: ConfigMap
data:
  # api 접근 용도로만 사용할꺼기 때문에 apiKey 만 적어준다
  accounts.image-updater: apiKey
```
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