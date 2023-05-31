if test -z $DESK_EXPORTED
    ,set-pleo-env production
    set -x DESK_EXPORTED true
end

# Always end with this to get a list of all desks
# set -x DESK_NAMES $DESK_NAMES $DESK_NAME
