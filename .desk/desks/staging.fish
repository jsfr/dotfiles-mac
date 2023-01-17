if test -z $DESK_EXPORTED
    set -x KUBECONFIG $HOME/.kube/config-eks-staging
    set -x VAULT_ADDR http://vault.k8s-product.vault.staging.internal
    set -x AWS_PROFILE staging

    open -a Access
    ssocred staging

    set -x DESK_EXPORTED true
end
