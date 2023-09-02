#!/usr/bin/env python3

# <bitbar.title>Yabai</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Jens Fredskov</bitbar.author>
# <bitbar.author.github>jsfr</bitbar.author.github>
# <bitbar.desc>Shows currently in-use spaces</bitbar.desc>
# <bitbar.dependencies>python3</bitbar.dependencies>

# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

import subprocess
import json


def print_spaces(spaces, has_sticky_windows):
    shift = 0

    if not has_sticky_windows:
        spaces = [s for s in spaces if len(s["windows"]) > 0 or s["has-focus"]]

    for space in spaces:
        index = space["index"] - shift
        if space["is-native-fullscreen"]:
            icon = ":f.square:"
            shift += 1
        elif has_sticky_windows or space["has-focus"]:
            icon = f":{index}.square.fill:"
        else:
            icon = f":{index}.square:"
        print(icon, end="")

    print(" | sfsize = 14")


if __name__ == "__main__":
    spaces = json.loads(
        subprocess.run(["yabai", "-m", "query", "--spaces"],
                       stdout=subprocess.PIPE)
        .stdout.decode("utf-8")
        .strip()
    )

    windows = json.loads(
        subprocess.run(["yabai", "-m", "query", "--windows"],
                       stdout=subprocess.PIPE)
        .stdout.decode("utf-8")
        .strip()
    )

    has_sticky_windows = any(w["is-sticky"] for w in windows)

    print_spaces(spaces, has_sticky_windows)
