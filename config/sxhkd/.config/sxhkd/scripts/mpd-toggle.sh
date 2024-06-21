#!/bin/sh

pid="$(pgrep -a "polybar" | grep -e "music-player" | grep -o "[0-9]*")"
state="$(xwininfo -name "polybar-music-player_DisplayPort-0" | grep -o 'IsUnMapped')"

if [ $state == "IsUnMapped" ]; then
    polybar-msg cmd show
    ~/.config/dunst/scripts/mpd_dunst.sh
else
    polybar-msg cmd hide
    dunstctl close &
    bspc config -m focused bottom_padding $((`bspc config -m focused bottom_padding` - 42 ))
fi

