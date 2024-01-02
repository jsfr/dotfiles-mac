if test -z "$DESK_EXPORTED"
    osascript -e "
    tell application \"System Events\" to tell application process \"NextDNS\"
    click menu bar item 1 of menu bar 1
    click menu item \"Disable\" of menu 1 of menu bar item 1 of menu bar 1
    end tell
    " > /dev/null
    function exit_handler --on-event fish_exit
        osascript -e "
        tell application \"System Events\" to tell application process \"NextDNS\"
        click menu bar item 1 of menu bar 1
        click menu item \"Enable\" of menu 1 of menu bar item 1 of menu bar 1
        end tell
        " > /dev/null
        osascript -e "quit app \"Access\"" > /dev/null
    end

    open -g -j -a Access

    set -gx KUBECONFIG $HOME/.kube/config_desk
    set -gx DESK_EXPORTED true

    oo
end
