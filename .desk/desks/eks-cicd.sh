if [[ -z $DESK_EXPORTED ]]; then
    ,set-pleo-env eks cicd
    export DESK_EXPORTED=true
fi
