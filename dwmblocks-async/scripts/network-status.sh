#!/bin/bash

iface=$(ip -o link show | awk -F': ' '{print $2}' | while read dev; do
    case "$dev" in
        lo|tun*|tap*|virbr*|docker*|veth*|br-*) continue ;;
    esac
    
    state=$(ip link show "$dev" | grep -oP 'state \K\S+')
    if [ "$state" != "UP" ]; then
        continue
    fi
    
    if ip addr show "$dev" | grep -q "inet "; then
        echo "$dev"
        break
    fi
done)

if [ -n "$iface" ]; then
    if [ -d "/sys/class/net/$iface/wireless" ]; then
        ssid=$(iw dev "$iface" link 2>/dev/null | grep -oP 'SSID: \K.*')
        if [ -n "$ssid" ]; then
            echo "📶 $ssid"
        else
            echo "📶 WiFi"
        fi
    else
        echo "🔗 ETH"
    fi
else
    echo "❌ No Net"
fi
