rm -rf ~/.vim*
git clone git://github.com/zenhack/vim-config .vim
mkdir -p ~/.vim/colors
cp ~/Dropbox/obsidian.vim ~/.vim/colors/
git clone https://github.com/Shougo/neocomplete.vim.git  ~/.vim/bundle/neocomplete.vim
rm ~/.vim/vimrc && cp ~/Dropbox/vimrc ~/.vim/vimrc


#curl -Lo- http://bit.ly/janus-bootstrap | bash
