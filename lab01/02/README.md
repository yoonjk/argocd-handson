## Install guestbook using Argo CD Cli

argocd app create guestbook2 --repo https://github.com/yoonjk/argocd-demo.git \
--revision master \
--path guestbook \
--dest-server https://kubernetes.default.svc --dest-namespace user00 --sync-option CreateNamespace=true

