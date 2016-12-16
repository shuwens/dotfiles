rm -rf ~/.vim*
git clone git://github.com/W4RH4WK/dotVim.git ~/.vim
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s .vim/vimrc ~/.vimrc
vim +BundleInstall +qall

cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --all
