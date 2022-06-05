#!/bin/sh
AUR=yay
# Options includes "all"/"partial"
# Use the latter if you want to manually install CodeVS theme 
# Or you haven't initialize CodeVS even once
# As well as activating all files
OPTIONS="all" 
IGNORE="yes" # Dependencies will be installed if IGNORE = "no", Will ask before install with "ask"
STARTUP="all" # Automatically applies all config, only applicable if OPTION = "All"

install_package(){
    $AUR -S rofi sxhkd picom-jonaburg-fix polybar mpd ncmpcpp python-ueberzug-git \
    xorg-xrdb xorg-xinit zsh stow gotop code zscroll-git dunst
}

echo "Checking commands"

if ! [ -x $(command -v $AUR &> /dev/null) ]; then
    echo "Command not found, please change the AUR manager you use in ./install.sh\n
          Alternatively, manually install the necessary dependencies"
    exit
fi

if [ $IGNORE == "no" ]; then
    echo "Ignore options found, installing dependencies"
    install_package
else 
    while true; do
        read -p "Do you want to install the dependencies? [Y/n]" yn
        case $yn in
            [Yy]* ) install_package; break;;
            [Nn]* ) break;;
            * ) break;;
        esac
    done
fi


if [ $OPTIONS == "all" ]; then
    echo "Stowing all files"
    cd config && make
    #Escape because we will need to check other section later
    cd ..
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

    if ! [ $(ls ~/.config/systemd/user | grep mpc-dunst.service) ]; then
        echo "mpc-dunst.service not found, Attempting to apply mpc-dunst.service"
        cp systemd/mpc-dunst.service ~/.config/systemd/user
    else 
        echo "mpc-dunst.service found"
    fi

    # For notification
    if ! [ $(ls /usr/local/bin | grep mpc-idle.sh) ]; then
        if [ $IGNORE == "ask" ]; then
            while true; do
                read -p "Do you want to install mpc-idle for dunst notification (sudo required)? [Y/n]" yn
                case $yn in
                    [Yy]* ) sudo cp config/dunst/.config/dunst/scripts/mpc_idle.sh /usr/local/bin; break;;
                    [Nn]* ) break;;
                * ) break;;
                esac
            done

            #User run systemd
            systemctl --user enable mpc-dunst.service
        elif [ $IGNORE == "yes" ]; then
            echo "Copying mpc-idle script"
            sudo cp config/dunst/.config/dunst/scripts/mpc_idle.sh /usr/local/bin

            #User run systemd
            systemctl --user enable mpc-dunst.service
        fi
    fi 

    echo "Installation done, manual intervention needed:"
    echo ""
elif [ $OPTIONS == "partial" ]; then
    echo "Partial stow"
    cd config && make partial

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
echo "Copy dunst mpc script and enable it for systemd servers"
echo "cp systemd/mpc-dunst.service ~/.config/systemd/user"
echo "sudo cp ~/.config/dunst/scripts/mpc-idle.sh /usr/local/bin"
echo "systemctl --user enable mpc-dunst.service"

