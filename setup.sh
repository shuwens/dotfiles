#!/bin/bash 

# ZSH
stow zsh        -t ~
stow bash        -t ~
stow tmux         -t ~
stow X          -t ~
#stow awesome35  -t ~/.config/
#stow emacs      -t ~
#stow scripts    -t ~
#stow esmtp      -t ~
stow screen     -t ~
#stow mutt       -t ~
#stow XMonad     -t ~
stow urxvt      -t ~
stow bin        -t ~

mkdir -p ~/.config/zathura/
ln -s  ~/git/dotfiles/misc/zathurarc ~/.config/zathura/zathurarc
ln -s ~/git/dotfiles/emacs/.spacemacs  ~/.spacemacs

##---------------
#    Optional:
##---------------
#stow ssh        -t ~
#stow config     -t ~/.config

## Gnome setting changes!
# screenshots..
mkdir -p ~/Templates/Pictures/screenshots/
#gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Templates/Pictures/screenshots/"

