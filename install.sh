#!/bin/bash
set -e

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# install font 
sudo apt remove thunderbird nano
sudo apt-add-repository -y ppa:rael-gc/scudcloud
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo add-apt-repository ppa:linrunner/tlp

sudo apt-get update

# install my personal utils 
sudo apt-get install -y xfonts-terminus console-terminus silversearcher-ag \
  mercurial zathura exuberant-ctags stow meld vlc python-pip zsh \
  chromium-browser gnome-tweak-tool

# tlp
sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-dkms

# mendeley
sudo apt install -y qt4-dev-tools libqtsvg4-perl libqtwebkit4

# glide
# https://github.com/Masterminds/glide
sudo apt install -y golang-glide

# latex
sudo apt-get install texlive-latex-extra  python-pygments

# haskell
sudo apt install -y haskell-stack darcs
stack install ghc-mod

# python pip
sudo apt install -y python-pip
sudo pip install pylint pyflakes

# java
sudo apt-get install openjdk-8-jdk

# install rust first, then install exa
curl https://sh.rustup.rs -sSf | sh
cargo install --no-default-features --git https://github.com/ogham/exa

# sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# instlal magic wormhole
pip install --user magic-wormhole

# I need talk to switches
sudo apt-get install minicom


#console-setup-linux
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

