#!/bin/bash

set -e
rm -rf ~/.vim*
rm -rf ~/.config/nvim*
rm -rf ~/.gvim*

# ----
# YAVC
# ----
echo "Installing my vim ..."
#git clone git@github.com:shwsun/yavc.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc &&  vim -u NONE -e -c "mkspell! $HOME/.vim/spell/en.utf-8.add" -c q
echo ""
echo "rm ~/.vim/plugged/c-support/c-support/templates/Templates"
echo "cp ~/.vim/plugin/Templates ~/.vim/plugged/c-support/c-support/templates"
echo ""

echo "Install my neovim ..."
git clone git@github.com:jethrosun/yavc.git -b neovim ~/.config/nvim

#  rafi
#git clone https://github.com/rafi/vim-config.git ~/.config/nvim

# phonix
#git clone https://github.com/phoenixlzx/dotvim.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc

# good
#rm -rf ~/.gvim* && rm -rf ~/dotfiles && git clone https://github.com/NLKNguyen/dotfiles ~/dotfiles && ln -s ~/dotfiles/vimrc ~/.vimrc && ln -s ~/dotfiles/gvimrc ~/.gvimrc && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall

# zenhack
#git clone git://github.com/zenhack/vim-config ~/.vim && cd ~/.vim && ./setup.sh

# spf-13
#sh <(curl https://j.mp/spf13-vim3 -L)

# cacay
# huge problem: will keep creating ~
#git clone https://github.com/cacay/vimrc.git  ~/.vim_runtime  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/plugin/Vundle.vim && echo "source ~/.vim_runtime/vimrc/main.vim" >> ~/.vimrc && vim +PluginInstall +qall && cd /home/jethros/.vim_runtime/plugin/YouCompleteMe ; ./install.py --clang-completer --go-completer --rust-completer

# -----------------------
# Jess fraz
# -----------------------
#git clone --recursive https://github.com/jessfraz/.vim.git ~/.vim && ln -sf $HOME/.vim/vimrc $HOME/.vimrc && cd $HOME/.vim && git submodule update --init




# end of vide.sh
