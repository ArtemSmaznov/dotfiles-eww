#!/usr/bin/env bash

devices=$("$HOME"/.local/bin/btctl.sh get devices)

json_output="["

for name in $devices ; do
    icon=$("$HOME"/.local/bin/btctl.sh get charge icon "$name")
    charge=$("$HOME"/.local/bin/btctl.sh get charge level "$name")
    state=$("$HOME"/.local/bin/btctl.sh get charge state "$name")
    json_output+="[\"$name\",\"$icon\",$charge,\"$state\"],"
done

json_output="${json_output%,}]"

echo "$json_output" | jq .
