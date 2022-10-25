## User 추가 
```bash
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