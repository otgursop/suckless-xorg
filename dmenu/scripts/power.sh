#!/bin/bash
choice="$(echo -e "lock\nexit session\npoweroff\nreboot" | dmenu -c -bw 3 -l 4 -i -p "choose:")"

case "$choice" in
  "lock") slock;;
  "exit session") pkill dwm;;
  "poweroff") poweroff;;
  "reboot") reboot;;
esac
