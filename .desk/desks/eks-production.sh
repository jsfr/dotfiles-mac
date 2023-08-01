if [[ -z $DESK_EXPORTED ]]; then
    ,set-pleo-env eks production
    export DESK_EXPORTED=true
fi
