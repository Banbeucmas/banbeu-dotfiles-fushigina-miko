#!/bin/bash

polybar -r main-bar-left & 
polybar -r main-bar-right & 
polybar -r main-bar-center &
# polybar -r music-player & sleep 1
#polybar -r music-player-center 

#Hide the music player bar
# polybar-msg cmd hide
# bspc config -m focused bottom_padding $((`bspc config -m focused bottom_padding` - 42 ))