#!/bin/bash

set -euo pipefail

sudo apt update
sudo apt install -y stow 

# Set up dotfiles
mkdir ~/git && cd ~/git
git clone https://github.com/shuwens/dotfiles.git
cd dotfiles && ./linux_setup.sh
# echo "Done, now install fish, fzf, eza, starship"

