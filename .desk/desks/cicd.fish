if test -z $DESK_EXPORTED
    set -x KUBECONFIG $HOME/.kube/config-eks-cicd
    set -x VAULT_ADDR http://vault.k8s-product.vault.cicd.internal
    set -x AWS_PROFILE cicd

    open -a Access
    ssocred cicd

    set -x DESK_EXPORTED true
end
