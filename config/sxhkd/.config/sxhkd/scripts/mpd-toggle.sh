#!/bin/sh

pid="$(pgrep -a "polybar" | grep -e "music-player" | grep -o "[0-9]*")"
state="$(xwininfo -name "polybar-music-player_HDMI-A-0" | grep -o 'IsUnMapped')"

if [ $state == "IsUnMapped" ]; then
    polybar-msg cmd show
else
    polybar-msg cmd hide
    bspc config -m focused bottom_padding $((`bspc config -m focused bottom_padding` - 42 ))
fi