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
sudo pacman -S firefox-developer-edition emacs tmux alacritty neovim the_silver_searcher tk zathura zathura-pdf-poppler tailscale 
sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code ttf-fira-sans ttf-linux-libertine

sudo paru -S google-chrome slack-desktop dropbox ttf-monaco
# sudo paru -S texlive biber texlive-lang


# on remote linux
stow server -t ~
# apt-get install silversearcher-ag


## dot config
#cd config || exit
#stow -t ~/.config  .config




