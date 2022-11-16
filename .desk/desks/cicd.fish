set -x KUBECONFIG $HOME/.kube/config-eks-cicd
set -x VAULT_ADDR http://vault.k8s-product.vault.cicd.internal
set -x AWS_PROFILE cicd

ssocred cicd

# Always end with this to get a list of all desks
set -x DESK_NAMES $DESK_NAMES $DESK_NAME
