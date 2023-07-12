
## Install Argo CD
https://argo-cd.readthedocs.io/en/stable/getting_started/
- Install
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

- Download Argo CD CLI¶
```bash
brew install argocd
```
- Port Forward
kubectl port-forward svc/argocd-server -n argocd 8080:443

- Get Password
ARGOCD_PASSWD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

- Login Using The CLI
argocd login localhost:8080 --username admin --password $ARGOCD_PASSWD \
--insecure

- Change the password using the command
argocd account update-password

- Creating Apps Via CLI
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default

## Delete Argo CD
```bash
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Change Automated Sync Policy default interval value in Argo CD
kubectl patch cm/argocd-cm -p='{"data":{"timeout.reconciliation": "20s"}}' -n argocd
kubectl delete pod argocd-application-controller-0 -n argocd
argocd app set sample --auto-prune