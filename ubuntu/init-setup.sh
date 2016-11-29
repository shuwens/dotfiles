#!/bin/bash

# @brief: some config on ubuntu
# @author: Jethro Shuwen Sun



sudo apt update -y
sudo aot upgrade -y

sudo apt install vim git gnome-tweak-tool xfonts-terminus -y 


# use bashrc
cd ../bash && mv ~/.bashrc ~/.bashrc.bak && cp .bashrc ~/.bashrc && bash

# use git config
cd ../X && cp .gitconfig ~

# install emacs 25
# from stackoverflow abo-abo: http://emacs.stackexchange.com/questions/12772/prebuilt-ubuntu-emacs-25-1
sudo add-apt-repository -y ppa:ubuntu-elisp
sudo apt-get update -y
sudo apt-get install emacs-snapshot -y

# install my emacs config
git clone https://github.com/shwsun/emacs.d.git ~/.emacs.d 
cd ~/.emacs.d && git checkout beta

# install spf vim
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh



