#!/bin/bash 

# ZSH
stow bash        -t ~
stow zsh         -t ~
stow fish        -t ~
stow tmux        -t ~
stow todo        -t ~
stow X           -t ~
stow screen      -t ~
stow urxvt       -t ~
stow bin         -t ~

mkdir -p ~/.config/zathura/
ln -s  ~/git/dotfiles/misc/zathurarc ~/.config/zathura/zathurarc
ln -s ~/git/dotfiles/emacs/.spacemacs  ~/.spacemacs

## Gnome setting changes!
# screenshots..
mkdir -p ~/Templates/Pictures/screenshots/
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Templates/Pictures/screenshots/"

