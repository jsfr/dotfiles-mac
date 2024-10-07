#!/usr/bin/env sh

# <bitbar.title>Aerospace Workspaces</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Jens Fredskov</bitbar.author>
# <bitbar.author.github>jsfr</bitbar.author.github>
# <bitbar.desc>Shows a list of Aerospace workspaces with windows on them.</bitbar.desc>
# <bitbar.dependencies>python3</bitbar.dependencies>

# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>false</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

focused_workspaces=$(aerospace list-workspaces --monitor all --visible)

workspaces=$(aerospace list-workspaces --monitor all --empty no)
workspaces=$(echo "$workspaces $focused_workspace" | tr ' ' '\n' | sort -h | uniq)

for workspace in $workspaces; do
    is_done=false
    for focused_workspace in $focused_workspaces; do
        if [ $workspace == $focused_workspace ]; then
            printf ':%s.square.fill:' "$workspace"
            is_done=true
            break
        fi
    done
    if [ $is_done = false ]; then
        printf ':%s.square:' "$workspace"
    fi
done

echo ' | sfsize = 14'
echo '---'
echo 'Reload config | terminal = false bash = /opt/homebrew/bin/aerospace param0 = reload-config'
echo 'Toggle AeroSpace | terminal = false bash = /opt/homebrew/bin/aerospace param0 = enable param1 = toggle'
