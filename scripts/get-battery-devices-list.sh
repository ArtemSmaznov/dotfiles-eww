#!/usr/bin/env bash

connected_devices=$("$HOME"/.local/bin/btctl.sh get devices connected)

json_output="["

for name in $connected_devices ; do
    icon=$("$HOME"/.local/bin/btctl.sh get charge icon "$name")
    charge=$("$HOME"/.local/bin/btctl.sh get charge level "$name")
    [ ! "$charge" ] && charge=0
    state=$("$HOME"/.local/bin/btctl.sh get charge state "$name")
    json_output+="[\"$name\",\"$icon\",$charge,\"$state\"],"
done

json_output="${json_output%,}]"

echo "$json_output" | jq .
