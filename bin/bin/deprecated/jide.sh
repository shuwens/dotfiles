#!/bin/bash

set -e
rm -rf ~/.vim*
rm -rf ~/.config/nvim*
rm -rf ~/.gvim*

# ----
# YAVC
# ----
echo "Installing Jon vim ..."
#git clone git@github.com:shwsun/yavc.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc &&  vim -u NONE -e -c "mkspell! $HOME/.vim/spell/en.utf-8.add" -c q
echo ""
#echo "rm ~/.vim/plugged/c-support/c-support/templates/Templates"
#echo "cp ~/.vim/plugin/Templates ~/.vim/plugged/c-support/c-support/templates"
echo ""

echo "Install Jon neovim ..."
#git clone https://github.com/jonhoo/configs.git ~/git/configs
cp -r ~/git/configs/.vim ~/.config/nvim
rm ~/.config/nvim/init.vim &&  cp -r ~/git/configs/.vimrc ~/.config/nvim/init.vim

# end of vide.sh
