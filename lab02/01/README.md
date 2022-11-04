
## Install Argo CD Notifications
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/manifests/install.yaml

## Install Triggers and Templates from the catalog
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml

or Helm 3
helm repo add argo https://argoproj.github.io/argo-helm
helm install argo/argocd-notifications --generate-name \
    --set triggers[0].name=on-sync-succeeded \
    --set triggers[0].enabled=true \
    --set secret.notifiers.slack.enabled=true \
    --set secret.notifiers.slack.token=<my-token>