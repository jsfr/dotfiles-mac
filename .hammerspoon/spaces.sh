#!/usr/bin/env sh

yabai="/usr/local/bin/yabai"
jq="/usr/local/bin/jq"

number_of_sticky_windows=$(
        $yabai -m query --windows |
                $jq -r "[.[] | select(.sticky == 1) | .id] | unique | length"
)

$yabai -m query --spaces |
        $jq -r "[.[] | select((.windows | length > ${number_of_sticky_windows}) or .focused == 1)]
        | reduce .[] as \$i (
        {shift: 0, focused: 0, spaces: []};
                if \$i.\"native-fullscreen\" == 1 then
                        {shift: (.shift + 1), focused: .focused, spaces: (.spaces + [\"f\"])}
                elif \$i.focused == 1 then
                        {shift: .shift, focused: (\$i.index - .shift), spaces: (.spaces + [\$i.index - .shift])}
                else
                        {shift: .shift, focused: .focused, spaces: (.spaces + [\$i.index - .shift])}
                end
        )"