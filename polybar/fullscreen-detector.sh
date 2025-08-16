#!/bin/bash

# Check if any window is fullscreen
if xprop -root _NET_ACTIVE_WINDOW | grep -q "window id"; then
    active_window=$(xprop -root _NET_ACTIVE_WINDOW | cut -d' ' -f5)
    if [[ -n "$active_window" ]] && [[ "$active_window" != "0x0" ]]; then
        if xprop -id "$active_window" _NET_WM_STATE | grep -q "_NET_WM_STATE_FULLSCREEN"; then
            # Hide all polybars
            polybar-msg cmd hide
        else
            # Show all polybars
            polybar-msg cmd show
        fi
    fi
fi