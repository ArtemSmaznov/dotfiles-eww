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

window="$1"

# functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# setup ________________________________________________________________________
if [ -n "$monitor_id" ]; then
    action="$action --screen $monitor_id"
fi

# execution ********************************************************************
eww $action "$window"
