#!/bin/bash 

stow bash        -t ~
stow zsh         -t ~
stow fish        -t ~
stow tmux        -t ~
stow todo        -t ~
stow backlog     -t ~
stow X           -t ~
stow screen      -t ~
stow urxvt       -t ~
stow bin         -t ~

stow -t ~   spacemacs

## dot config
cd config
stow -t ~/.config  .config



## Gnome setting changes!
# screenshots..
mkdir -p ~/Templates/Pictures/screenshots/
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Templates/Pictures/screenshots/"

