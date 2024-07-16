#!/usr/bin/env bash
# variables ====================================================================
action="open --toggle"

# options ----------------------------------------------------------------------
while getopts "a:m:" o; do
    case "$o" in
        a) action="${OPTARG}" ;;
        m) monitor_id="${OPTARG}"
           [[ ! "$monitor_id" =~ ^[0-9]*$ ]] && echo "error: expected id for monitor" >&2 && exit 1
           ;;
        *) exit 1 ;;
    esac
done
shift $((OPTIND-1))

window_name="$1"

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
is_window_active () {
    eww active-windows | grep -q "$window_name"
}

# setup ________________________________________________________________________
if is_window_active; then
    action="close"
else
    action="open"
fi

if [ -n "$monitor_id" ] ; then
    if [ ! $action == "close" ]; then
        action="$action --screen $monitor_id"
    fi
fi

# execution ********************************************************************
eww $action "$window_name"
