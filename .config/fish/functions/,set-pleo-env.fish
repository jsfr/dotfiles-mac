function ,set-pleo-env -a env
    set -gx KUBECONFIG $HOME/.kube/config-eks-$env
    set -gx VAULT_ADDR http://vault.k8s-product.vault.$env.internal
    set -gx AWS_PROFILE $env

    ssocred $env

    echo "  ####################################################"
    echo "  ### Remember to disable NextDNS and start Access ###"
    echo "  ####################################################"
end
