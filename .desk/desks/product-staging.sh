if [[ -z $DESK_EXPORTED ]]; then
    ,set-pleo-env product staging
    export DESK_EXPORTED=true
fi
