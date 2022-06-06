# banbeu-dotfiles-fushigina-miko
![image](https://user-images.githubusercontent.com/10562127/171936025-22c9139f-2de3-4a68-9869-e28e8fb922e7.png)

## Introduction
This project is aim to revamps my whole Linux dotfiles, I have been using my current dotfiles for 5 years, and with my machine getting to the point of reinstallation, It's time for me to rerice my beloved machine again.

This also serves as a practice time for me when it comes to Bash and Linux management.
This setup is based on one of my old rice, but with rounded corner thanks to the advancement of science 🥳

## Basic information
**OS:** Arch Linux  
**WM:** bspwm  
**DE:** XFCE  
**Wallpaper:** [◇不思議な巫女◇ by 萃, click here to check](https://www.pixiv.net/en/artworks/65066440)  
**Terminal:** xst  
**Fonts:** Cascadia Code + Source Han Serif JP  
**Editor:** Neovim  
**Menu:** rofi  
**Bar:** Polybar  
**Music player:** ncmpcpp + mpd

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
![showcase](https://github.com/Banbeucmas/banbeu-dotfiles-fushigina-miko/blob/main/Showcase_Image.png)

## Frequenly Asked Question
**Q:** Why don't you post your wallpaper?  
**A:** At least have some respect for the artist, check their work out!


**Q:** How do you manage your dotfiles?  
**A:** I know some has been using bare repository to manage their dotfiles recently, I prefer to use `stow` and `make` to symlink everything, try it out.

**Q:** Your `./install.sh` is bad you know?  
**A:** Yes..., at least it gonna work once I make my theme switcher

**Q:** How does your shadow works with rounded corner?  
**A:** ``picom-jonaburg-fix`` works like a charm, just make sure the compositor handles everything regarding corners

**Q:** Can I post suggestion?  
**A:** Sure, post an issue. I need to clean `install.sh`

**Q:** How can I tslk to you?
**A:** I am fairly active in my own Discord. [Click here to join](https://discord.gg/CB9kw68)


