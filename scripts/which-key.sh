#!/usr/bin/env bash
# options ----------------------------------------------------------------------
new_submap="$1"
parent_submap="$2"

# variables ====================================================================
keymap="$(~/.config/hypr/scripts/get-submap-keys.sh "$new_submap")"

# execution ********************************************************************
eww update current-keymap="$keymap"
eww update wm-parent-key-chord="$parent_submap"
eww open which-key
