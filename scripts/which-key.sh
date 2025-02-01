#!/usr/bin/env bash

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function close() {
    eww close which-key
    exit 0
}

# options ----------------------------------------------------------------------
while getopts "p:c" opt; do
    case "$opt" in
    p) list_of_parents="${OPTARG}" ;;
    c) close ;;
    *) exit 1 ;;
    esac
done
shift $((OPTIND - 1))

new_submap="$1"

# variables ====================================================================

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function process_parents() {
    echo "$list_of_parents"
}

# setup ________________________________________________________________________
wm_keymap_json="$(~/.config/hypr/scripts/get-keys.sh "$new_submap")"

# execution ********************************************************************
eww update wm-keybinds-map="$wm_keymap_json"
eww update wm-keychord-parents="$(process_parents)"
eww open which-key
