set -x KUBECONFIG $HOME/.kube/config-eks-production
set -x VAULT_ADDR http://vault.k8s-product.vault.production.internal
set -x AWS_PROFILE production

open -a Access

ssocred production

# Always end with this to get a list of all desks
set -x DESK_NAMES $DESK_NAMES $DESK_NAME
