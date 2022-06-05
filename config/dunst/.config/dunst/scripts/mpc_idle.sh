#!/bin/sh

while true; do
    mpc idle
    ~/.config/dunst/scripts/mpd_dunst.sh
done