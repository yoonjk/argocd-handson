kubectl patch cm argocd-notifications-cm -n argocd \
-p "$(cat notifications-cm.yaml)" \
--type merge