#!/bin/sh

if [[ $(systemctl --user status mpc-dunst.service | grep inactive) ]]; then
    systemctl --user start mpc-dunst.service
    polybar-msg action mpc-dunst-toggle hook 1
else 
    systemctl --user stop mpc-dunst.service
    polybar-msg action mpc-dunst-toggle hook 0
fi

