#!/bin/bash

stow alacritty	-t ~
stow bash		-t ~
stow fish		-t ~
stow tmux		-t ~
stow X			-t ~
stow screen		-t ~
# stow bin		-t ~
stow scripts	-t ~
stow bspwm		-t ~

# stow -t ~   spacemacs

## dot config
cd config || exit
stow -t ~/.config  .config

## Gnome setting changes!
# screenshots..
# mkdir -p ~/Templates/Pictures/screenshots/
# gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Templates/Pictures/screenshots/"


# arch 
# install paru
sudo pacman -S firefox-developer-edition emacs tmux alacritty neovim ttf-jetbrains-mono-nerd ttf-fira-code ttf-fira-sans



sudo paru -S google-chrome slack-desktop dropbox
# sudo paru -S texlive biber 
