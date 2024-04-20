#!/usr/bin/env bash

"$HOME"/.local/bin/btctl.sh get devices |
    jq -R -s 'split("\n") | map(select(length > 0))'
