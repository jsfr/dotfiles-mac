set -x KUBECONFIG $HOME/.kube/config-kops-staging

# Always end with this to get a list of all desks
set -x DESK_NAMES $DESK_NAMES $DESK_NAME