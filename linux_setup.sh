#!/bin/bash

# stow bin		-t ~
stow scripts	-t ~

. /etc/os-release

case $ID in
    ubuntu)
        echo "This is Ubuntu!"
        sudo apt install -y stow 
        mv ~/.bashrc ~/.bashrc.bak || true
        stow server -t ~
        sudo apt update
        sudo apt install -y neovim fish ranger silversearcher-ag make net-tools
        chsh -s $(which fish)
        echo "Done!"
        ;;

    arch)
        echo "This is Arch Linux!"
        stow bspwm		-t ~
        stow screen		-t ~
        # only on arch
        stow tmux		-t ~
        stow fish		-t ~
        stow bash		-t ~
        stow alacritty	-t ~
        stow X			-t ~

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
