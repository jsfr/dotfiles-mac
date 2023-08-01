if [[ -z $DESK_EXPORTED ]]; then
    ,set-pleo-env eks staging
    export DESK_EXPORTED=true
fi
