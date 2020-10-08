set -x KUBECONFIG $HOME/.kube/config-eks-staging

# Always end with this to get a list of all desks
set -x DESK_NAMES $DESK_NAMES $DESK_NAME
