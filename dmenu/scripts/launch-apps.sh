#!/bin/bash

DESKTOP_DIRS="/usr/share/applications ~/.local/share/applications"

get_names() {
    find $DESKTOP_DIRS -name "*.desktop" 2>/dev/null | while read -r file; do
        grep -q "^NoDisplay=true" "$file" 2>/dev/null && continue
        name=$(grep -m 1 "^Name=" "$file" 2>/dev/null | cut -d'=' -f2-)
        [ -n "$name" ] && echo "$name"
    done | sort -u
}

selected=$(get_names | dmenu -c -bw 3 -l 10 -i -p "launch:")
[ -z "$selected" ] && exit 0

exec_cmd=$(find $DESKTOP_DIRS -name "*.desktop" 2>/dev/null | while read -r file; do
    name=$(grep -m 1 "^Name=" "$file" 2>/dev/null | cut -d'=' -f2-)
    if [ "$name" = "$selected" ]; then
        grep -m 1 "^Exec=" "$file" 2>/dev/null | cut -d'=' -f2- | sed 's/ %[fFuUdDnNickvm]//g'
        break
    fi
done)

[ -n "$exec_cmd" ] && nohup $exec_cmd >/dev/null 2>&1 &
