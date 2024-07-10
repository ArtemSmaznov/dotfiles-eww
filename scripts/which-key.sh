#!/usr/bin/env bash
# options ----------------------------------------------------------------------
new_submap="$1"
parent_submap="$2"
separator=">"

# variables ====================================================================
keymap="$(~/.config/hypr/scripts/get-submap-keys.sh "$new_submap")"

# setup ________________________________________________________________________
[ "$parent_submap" ] && submap_path="$parent_submap$separator"
submap_path+="$new_submap"

# execution ********************************************************************
eww update current-keymap="$keymap"
eww update wm-parent-key-chord="$submap_path$separator"
eww open which-key
