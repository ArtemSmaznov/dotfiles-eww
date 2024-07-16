#!/usr/bin/env bash
# options ----------------------------------------------------------------------
new_submap="$1"
submap_parents="${*:2}"

# variables ====================================================================
keymap="$(~/.config/hypr/scripts/get-submap-keys.sh "$new_submap")"

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function build_json () {
    json_output="["

    for submap in $submap_parents; do
        json_output+="\"$submap\","
    done

    json_output="${json_output%,}]"

    echo "$json_output" | jq .
}

# setup ________________________________________________________________________
eww update wm-parent-key-chord="$(build_json)"
eww update current-keymap="$keymap"

# execution ********************************************************************
eww open which-key
