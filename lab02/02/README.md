
## Subscribe to notifications
```bash
kubectl patch app guestbook -n argocd \
-p '{"metadata": {"annotations": {"notifications.argoproj.io/subscribe.on-sync-succeeded.slack":"my_channel"}}}' \
--type merge
## Copy OAuth Token in slack
https://api.slack.com/apps?new_app=1

export SLACK_TOKEN=xoxb-3858639688981-3949676295332-BrxCIZ9ZyiF0dGoQBt5MXN8o

kubectl patch secret argocd-notifications-secret -n argocd \
--type merge \
-p '{"stringData": {"slack-token": "Slack OAuth Token"}}'

