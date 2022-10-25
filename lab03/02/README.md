## green => blue 
kubectl argo rollouts set image canary-rollouts-demo  \
rollouts-demo=argoproj/rollouts-demo:yellow

## rollout 시작
kubectl argo rollouts promote canary-rollouts-demo

## watch
kubectl argo rollouts get rollout canary-rollouts-demo -w