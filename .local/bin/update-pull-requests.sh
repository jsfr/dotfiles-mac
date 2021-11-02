#!/usr/bin/env bash

/usr/bin/pgrep -fi hammerspoon && /usr/local/bin/hs -c "pull_requests.update()"

exit 0
