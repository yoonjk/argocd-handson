

## Install Argo
kubectl create ns argo
kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/quick-start-postgres.yaml

## port-forward 후  https로 접속해야함 
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

kubectl create secret generic github-basic \
--namespace=argo \
--from-literal=username=username \
--from-literal=personal_access_token=my-personal-token