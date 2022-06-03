#!/bin/sh
AUR=yay
# Options includes "all"/"partial"
# Use the latter if you want to manually install CodeVS theme 
# Or you haven't initialize CodeVS even once
# As well as activating all files
OPTIONS="all" 
IGNORE="yes" # Dependencies will be installed if IGNORE = "no"
STARTUP="all" # Automatically applies all config, only applicable if OPTION = "All"
echo "Checking commands"

if ! [ -x $(command -v $AUR &> /dev/null) ]; then
    echo "Command not found, please change the AUR manager you use in ./install.sh\n
          Alternatively, manually install the necessary dependencies"
    exit
fi

if [ $IGNORE == "no" ]; then
    echo "Ignore options found, installing dependencies"
    $AUR -S rofi sxhkd picom-jonaburg-fix polybar mpd ncmpcpp python-ueberzug-git xorg-xrdb xorg-xinit zsh stow gotop code zscroll-git
fi

if [ $OPTIONS == "all" ]; then
    echo "Stowing all files"
    make
    xrdb -merge ~/.Xresources
    zsh -c "source ~/.zshrc"

    if [ $STARTUP = "all" ]; then
        if ! [ $(pgrep -x polybar &> /dev/null) ]; then
            echo "Killing polybar"
            #Nuclear, I am not sure you gonna use ipc
            killall -q polybar
        fi

        if ! [ $(pgrep -x bspwm &> /dev/null)  ]; then
            echo "Reloading bspwm"
            bspc wm -r
        else 
            echo "Enabling bspwm"
            bspwm &
        fi

        if [ $(pgrep -x xst &> /dev/null) ]; then
            echo "Reloading xst"
            killall -USR1 xst
        fi
    fi

    echo "Installation done, manual intervention needed:"
    echo ""
elif [ $OPTIONS == "partial" ]; then
    echo "Partial stow"
    make partial

    echo "Installation done, manual intervention needed:"
    echo ""
    echo "Merging .Xresources:"
    echo "xrdb -merge ~/.Xresources"
    echo ""
    echo "Sourcing .zshrc:"
    echo "source ~/.zshrc"
    echo ""
else 
    echo "Stow option not found, assuming manual install later on"
fi


echo "Manual symlink ncmpcpp-ueberzug to your local bin and run ncmpcpp-ueberzug if you want cover pics"
echo "Example: ln -s $$HOME/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueburzug $$HOME/.local/bin"
echo ""



