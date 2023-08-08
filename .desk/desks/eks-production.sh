,set-pleo-env () {
    prefix="$1"
    env="$2"


    export KUBECONFIG="$HOME/.kube/config-$prefix-$env"
    export VAULT_ADDR="http://vault.k8s-product.vault.$env.internal"
    export AWS_PROFILE="$env"

    ssocred $env

    cat << EOF
####################################################
### Remember to disable NextDNS and start Access ###
####################################################
EOF
}

if [[ -z $DESK_EXPORTED ]]; then
    ,set-pleo-env eks production
    export DESK_EXPORTED=true
fi
