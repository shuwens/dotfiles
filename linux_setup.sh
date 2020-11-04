#!/bin/bash

stow bash		-t ~
stow fish		-t ~
stow tmux		-t ~
stow X			-t ~
stow screen		-t ~
stow bin		-t ~
stow bspwm		-t ~

stow -t ~   spacemacs

## dot config
cd config || exit
stow -t ~/.config  .config

## Gnome setting changes!
# screenshots..
# mkdir -p ~/Templates/Pictures/screenshots/
# gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Templates/Pictures/screenshots/"

