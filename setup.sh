#!/bin/bash 

# ZSH
rm ~/.zshrc
stow zsh        -t ~
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

ln -s  ~/git/dotfiles/misc/zathurarc ~/.config/zathura/zathurarc
ln -s ~/git/dotfiles/emacs/.spacemacs  ~/.spacemacs

##---------------
#    Optional:
##---------------
#stow ssh        -t ~
#stow config     -t ~/.config


