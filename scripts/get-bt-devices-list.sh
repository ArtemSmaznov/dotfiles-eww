#!/usr/bin/env bash

paired_devices=$("$HOME"/.local/bin/btctl.sh get devices paired)

json_output="["

for name in $paired_devices ; do
    icon=$("$HOME"/.local/bin/btctl.sh device icon "$name")
    status=$("$HOME"/.local/bin/btctl.sh device status "$name")
    json_output+="[\"$name\",\"$icon\",\"$status\"],"
done

json_output="${json_output%,}]"

echo "$json_output" | jq .
