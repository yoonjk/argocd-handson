
kubectl create role jenkins --verb=list,update --resource=workflows.argoproj.io -n argo
 kubectl create sa jenkins
kubectl create rolebinding jenkins --role=jenkins --serviceaccount=argo:jenkins
ARGO_TOKEN="Bearer $(kubectl get secret -n argo argo-token-glcbv -o=jsonpath='{.data.token}' | base64 --decode)"

ARGO_TOKEN="Bearer $(kubectl get secret -n argo argo-token-glcbv -o=jsonpath='{.data.token}' | base64 --decode)"

curl https://localhost:2746/api/v1/workflows/argo -H "Authorization: $ARGO_TOKEN" -k

suspend-outputs-7vwsk

curl -X GET \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-7vwsk \
-H "Authorization: $ARGO_TOKEN" -k

## suspend

## resume
 argo resume suspend-outputs-qk5px -n argo --node-field-selector=displayNa
me="approve

curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-ghhqg/suspend?listOptions.nodeFieldSelector=displayName=approve \
-H "Authorization: $ARGO_TOKEN" -k

curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-bhs8s/resume?listOptions.nodeFieldSelector=inputs.parameters.message="test" \
-H "Authorization: $ARGO_TOKEN" -k

curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-bhs8s/resume?listOptions.nodeFieldSelector=displayName="approve"&listOptions.nodeFieldSelector.inputs.parameters.message="test" \
-H "Authorization: $ARGO_TOKEN" -k

curl https://localhost:2746/api/v1/workflows/argo -H "Authorization: $ARGO_TOKEN" -k | jq '.items[].status.nodes[] | select(.type=="Suspend" and .phase=="Running")'

curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-64sq4/resume \
-H "Authorization: $ARGO_TOKEN" -k

curl -X PUT \
"https://localhost:2746/api/v1/workflows/argo/suspend-outputs-ghhqg/set?listOptions.nodeFieldSelector=displayName=approve" \
-H "Authorization: $ARGO_TOKEN" -k

curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-qk5px/resume\?listOptions.nodeFieldSelector\=displayName\=approve \
-H "Authorization: $ARGO_TOKEN" -k

/api/v1/workflows/{namespace}/suspend-outputs-64sq4/resume

argo node set suspend-outputs-2zdts -n argo  --message="Test message" --node-field-selector displayName=approve

argo resume suspend-outputs-bhs8s -n argo  --node-field-selector=displayName="approve"

## Argo Resume
curl -X PUT \
https://localhost:2746/api/v1/workflows/argo/suspend-outputs-64sq4 /resume \
-H "Authorization: $ARGO_TOKEN" -k

argo node set suspend-outputs-64sq4 -n argo  --message="Test message" --node-field-selector displayName=approve