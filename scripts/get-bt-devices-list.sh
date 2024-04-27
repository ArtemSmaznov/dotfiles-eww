#!/usr/bin/env bash

"$HOME"/.local/bin/btctl.sh get devices connected |
    jq -R -s 'split("\n") | map(select(length > 0))'
