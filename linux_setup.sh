#!/bin/bash

stow screen		-t ~
# stow bin		-t ~
stow scripts	-t ~

# only on arch
stow tmux		-t ~
stow fish		-t ~
stow bash		-t ~
stow alacritty	-t ~
stow X			-t ~
stow bspwm		-t ~
# arch
# install paru
sudo pacman -S firefox-developer-edition emacs tmux alacritty neovim ttf-jetbrains-mono-nerd ttf-fira-code ttf-fira-sans the_silver_searcher

sudo paru -S google-chrome slack-desktop dropbox
# sudo paru -S texlive biber


# on remote linux
stow server -t ~
# apt-get install silversearcher-ag


## dot config
#cd config || exit
#stow -t ~/.config  .config




