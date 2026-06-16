#!/bin/bash

choice=$(cat ./emoji.txt | dmenu -c -bw 3 -l 6 -i -fn "JetBrainsMono Nerd Font:size=12:style=SemiBold" -p "Copy:")

if [ -n "$choice" ]; then
    choice=$(echo "$choice" | awk '{print $1}')
    echo -n "$choice" | xclip -selection clipboard
    notify-send "Copied" "$choice" 2>/dev/null
fi
