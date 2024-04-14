#!/usr/bin/env bash

"$HOME/.local/bin/get-bt-devices.sh" |
    jq -R -s 'split("\n") | map(select(length > 0))'
