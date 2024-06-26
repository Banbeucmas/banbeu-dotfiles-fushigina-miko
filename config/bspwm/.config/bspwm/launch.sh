#!/bin/sh

sxhkd &

bspc monitor -d 1 2 3 4 5 6 7 8 9 10 11  


bspc config border_width         2
bspc config window_gap          10
bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      false

bspc config focused_border_color "#e4b580"
bspc config normal_border_color "#ffecba"

# 1 monitor rules
bspc rule -a Xfce4-terminal desktop='^1'
bspc rule -a xst-256color:xst-256color desktop='^1'
bspc rule -a jetbrains-idea desktop='^4'
bspc rule -a jetbrains-webstorm desktop='^4'
bspc rule -a code desktop='^4'
bspc rule -a Chromium desktop='^2'
bspc rule -a Firefox desktop='^2'
bspc rule -a Nemo desktop='^5'
bspc rule -a File-roller desktop='^5'
bspc rule -a Mousepad desktop='^5'
bspc rule -a "wicd-client.py" desktop='^6'
bspc rule -a Steam desktop='^6'
bspc rule -a Krita desktop='^7'
bspc rule -a "Minecraft *" desktop='^8'
bspc rule -a mplayer2 state=floating
bspc rule -a "osu!" state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

# 2 monitor rules
if [[ $(xrandr | grep HDMI1) == *'HDMI1 connected'* ]]; then
    bspc rule -a discord monitor='eDP1'
    bspc rule -a TelegramDesktop monitor='eDP1'
else
    bspc rule -a discord desktop='^3'
    bspc rule -a TelegramDesktop desktop='^3'
fi


bspc rule -a xst-256color:xst-neofetch state=floating
bspc rule -a xst-256color:xst-panes state=floating
bspc rule -a xst-256color:xst-ttyclock state=floating
bspc rule -a xst-256color:xst-ncmpcpp state=floating
bspc rule -a xst-256color:xst-calendar state=floating focus=off monitor='HDMI1'


# sleep 1 && mpc add / && nitrogen --restore && ~/.config/polybar/launch.sh & 
mpc add / && nitrogen --restore && ~/.config/polybar/launch.sh &
# && ~/.scripts/animated_wallpaper ~/Pictures/Wallpapers/Reimu.mp4 &
