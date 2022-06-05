# banbeu-arch-dotfiles
![image](https://user-images.githubusercontent.com/10562127/171936025-22c9139f-2de3-4a68-9869-e28e8fb922e7.png)

## Introduction
This project is aim to revamps my whole Linux dotfiles, I have been using my current dotfiles for 5 years, and with my machine getting to the point of reinstallation, It's time for me to rerice my beloved machine again.

This also serves as a practice time for me when it comes to Bash and Linux management

## Basic information
**WM:** bspwm

**DE:** XFCE

**Wallpaper:** [Credit to 萃, click here to check](https://www.pixiv.net/en/artworks/65066440)

## To-do list
- [x] polybars
- [x] rofi-theme
- [ ] theme-swicher
- [x] zst
- [x] dotfile manager
- [x] music player
- [x] install scripts
- [x] notification
- [ ] logout interface (rofi)

## Installtion
Clone the repository
```bash
git clone https://github.com/Banbeucmas/banbeu-arch-dotfiles.git
cd banbeu-arch-dotfiles
```

For arch-based system. Edit `install.sh` and execute

I recommend putting ignore option to `ask` and set option to `partial` for existing user that has riced their setup

Else, install `rofi` `sxhkd` `picom-jonaburg-fix` `mpd` `libmpdclient` `polybar` `ncmpcpp` `python-ueberzug-git` `xorg-xrdb` `xorg-xinit` `zsh` `stow` `gotop` `code` `zscroll-git`, cd to the repository and manually use `stow` to apply the config

Alternatively, to stow all files, use 
```bash
cd config && make
```

If you want to have notification for mpd, copy my script and enable it as a service
```bash
cp systemd/mpc-dunst.service ~/.config/systemd/user
sudo cp config/dunst/.config/dunst/scripts/mpc_idle.sh /usr/local/bin

systemctl --user enable mpc-dunst.service
```

For wallpaper, I intentionally left it out of this rice, read above and apply the wallpaper manually if you want to use it for your rice

## Image
![image](https://user-images.githubusercontent.com/10562127/171936059-15a90575-3b48-4b11-9f4a-bcf787fc7c2c.png)
![image](https://user-images.githubusercontent.com/10562127/171935862-ff8607b9-2c0e-4633-95a1-b163b9e1031b.png)
![image](https://user-images.githubusercontent.com/10562127/171935937-a5a98a90-a015-4620-a82f-d3479abfde1e.png)



