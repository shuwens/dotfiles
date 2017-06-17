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
  mercurial zathura exuberant-ctags stow scudcloud 

sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-dkms


#console-setup-linux
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

