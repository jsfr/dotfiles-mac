#!/usr/bin/env bash

open -a "$1"
yabai -m query --windows | jq -r ".[] | select(.app == \"$1\") | .id" | head -n 1 | xargs -J % yabai -m window % --focus
