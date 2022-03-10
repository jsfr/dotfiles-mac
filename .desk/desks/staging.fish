set -x KUBECONFIG $HOME/.kube/config-eks-staging
set -x VAULT_ADDR http://vault.staging.internal
set -x AWS_PROFILE staging

# Always end with this to get a list of all desks
set -x DESK_NAMES $DESK_NAMES $DESK_NAME
