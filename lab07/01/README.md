
https://localhost:8090/workflows


export DOCKER_USERNAME=[USERNAME]
export DOCKER_TOKEN=[PERSONAL_ACCESS_TOKEN]
kubectl create secret generic docker-config --from-literal="config.json={\"auths\": {\"https://index.docker.io/v1/\": {\"auth\": \"$(echo -n $DOCKER_USERNAME:$DOCKER_TOKEN|base64)\"}}}" --namespace argo-events

kubectl create secret docker-registry docker-credentials \
--docker-server=https://index.docker.io/v1/ \
--docker-username=username\
--docker-password=password \
--docker-email=test@gmail.com \
-n argo
## Authorization for Git Push 
kubectl create secret generic github-credentials \
--namespace=argo \
--from-literal=username=username \
--from-literal=personal_access_token=my-personal-token

## User 추가 
kubectl edit cm  argocd-cm -n argo

kubectl patch cm argocd-cm -n argocd \
--type merge \
-p '{"data": {"accounts.user00": "apiKey, login"}}'

kubectl patch cm argocd-cm -n argocd \
--type merge \
-p '{"data": {"accounts.user01": "apiKey, login"}}'

kubectl patch cm argocd-cm -n argocd \
--type merge \
-p '{"data": {"accounts.user02": "apiKey, login"}}'

- Add Rbac for New Account 
kubectl get configmap argocd-cm -n argocd -o yaml > argocd-cm.yml

- Generate Token
argocd account generate-token --account user01