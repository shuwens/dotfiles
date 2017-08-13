#!/bin/bash 

echo "Some my fav fonts .."
sudo pacman -Syy terminus-font adobe-source-code-pro-font

echo "Now we talking about some awesome tools"
sudo pacman -Syy yaourt openssh rust

echo "Install sublime text"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy sublime-text

echo "Now do a system upgrade"
sudo pacman -Syu

echo "Now install AUR packages:"
echo "rxvt-unicode-patched silver-searcher-git "
