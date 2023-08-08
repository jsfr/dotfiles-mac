function _tide_item_desk
    if test -n "$DESK_NAME"
        _tide_print_item desk $tide_desk_icon' ' "$DESK_NAME"
    end
end
