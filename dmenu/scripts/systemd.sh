#!/bin/bash

$choice=$(echo -e "
udisks2: on\n
udisks2: off
" | dmenu -c -bw 3 -l 2 -i -p "choose:")

case "$choice" in
  "udisks2: on") 
    pkexec systemctl unmask udisks2 \
    && pkexec systemctl start udisks2 \
    && systemctl is-active --quiet udisks2 \
    && notify-send "udisks2 has been unmasked and started" \
    || notify-send "Failed to unmask or start udisks2"
  ;;
  "udisks2: off") 
    pkexec systemctl stop udisks2 \
    && pkexec systemctl mask udisks2 \
    && ! systemctl is-active --quiet udisks2 \
    && notify-send "udisks2 has been stopped and masked" \
    || notify-send "Failed to unmask or start udisks2"
  ;;
esac
