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

. /etc/os-release

case $ID in
  echo "This is Ubuntu!"
  ubuntu) stow server -t ~
  ;;

arch)
  echo "This is Arch Linux!"
  # install paru
  sudo pacman -S firefox-developer-edition emacs tmux alacritty neovim the_silver_searcher tk zathura zathura-pdf-poppler tailscale ranger
  sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code ttf-fira-sans ttf-linux-libertine ttf-dejavu-sans-mono-powerline-git

  sudo paru -S google-chrome slack-desktop dropbox ttf-monaco 
  # sudo paru -S texlive biber texlive-lang
  ;;

centos) echo "This is CentOS!"
  ;;

*) echo "This is an unknown distribution."
  ;;
esac

## dot config
#cd config || exit
#stow -t ~/.config  .config
