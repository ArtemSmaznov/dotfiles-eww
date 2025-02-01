#!/usr/bin/env bash
# options ----------------------------------------------------------------------
while getopts "p:" opt; do
    case "$opt" in
    p) list_of_parents="${OPTARG}" ;;
    *) exit 1 ;;
    esac
done
shift $((OPTIND - 1))

new_submap="$1"

# variables ====================================================================

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# setup ________________________________________________________________________
function process_parents() {
    echo "$list_of_parents"
}

wm_keymap_json="$(~/.config/hypr/scripts/get-keys.sh "$new_submap")"
eww update wm-keybinds-map="$wm_keymap_json"

eww update wm-keychord-parents="$(process_parents)"

# execution ********************************************************************
eww open which-key
