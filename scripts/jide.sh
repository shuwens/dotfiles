#!/bin/bash

rm -rf ~/.vim*
git clone --recursive https://github.com/jmcadden/.vim.git ~/.vim

rm ~/.vim/vimrc && cp ~/git/dotfiles/scripts/jvimrc ~/.vim/vimrc

# end of jide.sh
