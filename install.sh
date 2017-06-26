#!/bin/bash
set -e

#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# install font 
sudo apt remove thunderbird
sudo apt-add-repository -y ppa:rael-gc/scudcloud
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo add-apt-repository ppa:linrunner/tlp

sudo apt-get update

# install my personal utils 
sudo apt-get install -y xfonts-terminus console-terminus silversearcher-ag \
  mercurial zathura exuberant-ctags stow scudcloud meld vlc

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

sudo pip install pylint pyflakes


#console-setup-linux
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

