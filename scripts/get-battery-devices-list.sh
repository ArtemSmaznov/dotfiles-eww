#!/usr/bin/env bash

devices=$("$HOME/.local/bin/get-bt-devices.sh")

json_output="["

for name in $devices ; do
    icon=$("$HOME/.local/bin/get-bt-icon.sh" "$name")
    charge=$("$HOME/.local/bin/get-bt-charge-level.sh" "$name")
    json_output+="[\"$name\",\"$icon\",$charge],"
done

json_output="${json_output%,}]"

echo "$json_output" | jq .
