## Register Email notification service
```bash
kubectl patch cm argocd-notifications-cm -n argocd --type merge -p '{"data": {"service.email.gmail": "{ username: $email-username, password: $email-password, host: smtp.gmail.com, port: 465, from: $email-username }" }}'
```

## Subscribe to notifications
```bash
kubectl patch app guestbook -n argocd \
-p '{"metadata": {"annotations": {"notifications.argoproj.io/subscribe.on-sync-succeeded.slack":"my_channel"}}}' \
--type merge

kubectl patch app guestbook -n argocd \
-p '{"metadata": {"annotations": {"notifications.argoproj.io/subscribe.on-sync-succeeded.gmail":"nexweb0@gmail.com"}}}' \
--type merge
```

export SLACK_TOKEN=eG94Yi0zODU4NjM5Njg4OTgxLTM5NDk2NzYyOTUzMzItQnJ4Q0laOVp5aUYwZEdvUUJ0NU1YTjhvCg==

kubectl patch secret argocd-notifications-secret -n argocd \
--type merge \
-p '{"data": {"slack-token": "slack oauth token

