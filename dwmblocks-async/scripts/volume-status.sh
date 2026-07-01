#!/bin/bash

if command -v pactl >/dev/null 2>&1; then
    if pactl list short sinks | grep -q .; then
        mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
        volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
        
        if [ "$mute_status" = "yes" ]; then
            echo " ${volume:-0%} [off]"
        else
            echo "  ${volume:-0%}"
        fi
        exit 0
    fi
fi

if command -v amixer >/dev/null 2>&1; then
    if amixer sget Master >/dev/null 2>&1; then
        mixer="Master"
    elif amixer sget Speaker >/dev/null 2>&1; then
        mixer="Speaker"
    else
        mixer=""
    fi

    if [ -n "$mixer" ]; then
        info=$(amixer sget "$mixer")
        volume=$(echo "$info" | grep -oP '\d+%' | head -1)
        mute=$(echo "$info" | grep -oP '\[(on|off)\]' | tr -d '[]')

        if [ "$mute" = "off" ]; then
            echo " ${volume:-0%} [off]"
        else
            echo "  ${volume:-0%}"
        fi
        exit 0
    fi
fi

echo " [off]"
exit 1
