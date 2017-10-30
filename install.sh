#!/bin/bash
set -e

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

sudo apt remove thunderbird nano
#sudo apt-add-repository -y ppa:rael-gc/scudcloud

# install font 
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

# Thinkpad tlp
sudo add-apt-repository ppa:linrunner/tlp

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# linux kernel 
sudo apt-add-repository -y ppa:teejee2008/ppa

# install my personal utils 
sudo apt-get install -y xfonts-terminus console-terminus silversearcher-ag \
  mercurial zathura exuberant-ctags stow meld vlc python-pip zsh vagrant \
  chromium-browser gnome-tweak-tool golang-glide docker.io fonts-roboto curl

# tlp
sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-dkms

# mendeley
sudo apt install -y qt4-dev-tools libqtsvg4-perl libqtwebkit4

# glide
# https://github.com/Masterminds/glide
sudo apt install -y golang-glide

# latex
sudo apt-get install -y texlive-full texlive-latex-extra  python-pygments texlive-science

# haskell
sudo apt install -y haskell-stack darcs
stack install ghc-mod

# python pip
sudo apt install -y python-pip
sudo pip install pylint pyflakes virtualenv 

# java
sudo apt-get install openjdk-8-jdk maven

# install rust first, then install exa
curl https://sh.rustup.rs -sSf | sh
#cargo install --no-default-features --git https://github.com/ogham/exa

# ----------------------
#   Do the update
# ----------------------

# FIXME: Ubuntu release support problem
#   Temp fixes for umake, sy
sudo apt update

# Ubuntu make
#sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make

# IntelliJ Idea
sudo apt-add-repository ppa:mmk2410/intellij-idea



sudo apt-get install -y sublime-text ubuntu-make

# instlal magic wormhole
pip install --user magic-wormhole

# I need talk to switches
sudo apt-get install -y minicom

#sudo apt-get install -y ukuu

# IntelliJ Idea
sudo apt-get install -y intellij-idea-ultimate
# Umake pycharm
umake ide pycharm-professional

#console-setup-linux
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Master pdf, "
