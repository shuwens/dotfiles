rm -rf ~/.vim*

git clone https://github.com/cacay/vimrc.git  ~/.vim_runtime
echo "source ~/.vim_runtime/vimrc/main.vim" > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git   ~/.vim_runtime/plugin/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim_runtime/plugin/YouCompleteMe && python install.py --clang-completer #   --gocode-completer

#echo "let g:ycm_python_binary_path = 'python'" >> .vim_runtime/my_configs.vim
