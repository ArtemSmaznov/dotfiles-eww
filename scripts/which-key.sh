#!/usr/bin/env bash
# options ----------------------------------------------------------------------
submap="$1"

# variables ====================================================================
keymap="$(~/.config/hypr/scripts/get-submap-keys.sh "$submap")"

# execution ********************************************************************
eww update current-keymap="$keymap"
eww open which-key
