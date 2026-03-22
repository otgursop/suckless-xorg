#!/bin/sh

# Keyboard layouts
setxkbmap us,ru -option 'grp:alt_shift_toggle,caps:none' &

# Wallpapers
# feh --bg-scale ~/Pictures/wallpapers/wallpaper15.png &

# Tray
flameshot &
nm-applet &
# blueman-applet &

# Notifications
dunst &

# Status bar
dwmblocks &

# Compositor
picom -b 

# Mouse settings
# Turn off the acceleration
(sleep 2 && \
for id in $(xinput list | grep -i pointer | sed 's/.*id=\([0-9]*\).*/\1/'); do
    xinput set-prop $id "libinput Accel Profile Enabled" 0, 1 2>/dev/null
    xinput set-prop $id "libinput Accel Speed" 0 2>/dev/null
done && \
xset m 0 0 2>/dev/null) &

# DWM
while true; do
    dwm 2> ~/.dwm.log
done
