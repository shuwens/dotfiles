#!/bin/bash

rm -rf ~/.emacs.d

echo YCMD_DIR=/home/jethros/git/ycmd/

# mine
#git clone -b bleeding --single-branch git@github.com:shwsun/emacs.d.git ~/.emacs.d

# Spacemacs
git clone https://github.com/shwsun/spacemacs -b my-dev  ~/.emacs.d
#git clone https://github.com/shwsun/spacemacs -b develop  ~/.emacs.d

#mkdir -p ~/.emacs.d/private && cd ~/.emacs.d/private  && cp -r ~/repos/SPACE/dotspace/layers .
#cd ~/.emacs.d/private/layers && cp -r ~/repos/SPACE/langtool/layers/+tools/languagetool .
#cd ~/.emacs.d/layers/+tools/ && cp -r ~/repos/SPACE/cquery/layers/+tools/cquery .




#rm ~/.spacemacs  && rm -rf ~/.spacemacs.d

# spacemacs #1 
#git clone https://github.com/off99555/.spacemacs.d.git
# spacemacs #2
#cp -r ~/repos/config/spacemacs.d  ~/.spacemacs.d
# spacemacs #3
#cp -r ~/repos/ivanmansion-conf/dotfiles/emacs.d ~/.emacs.d


# fps
#git clone https://github.com/fangpeishi/emacs.d.git ~/.emacs.d

# another
#git clone https://github.com/cydparser/emacs.d.git ~/.emacs.d

#cd ~/git && git clone https://github.com/alexott/ecb

# ------------------------------------------
#          Emacs utils et
# ------------------------------------------

# Handle Ycmd if not exist
#if [ -d "$YCMD_DIR" ]; then
if [ -d $YCMD_DIR ]; then echo 'Ycmd Exists'; else
  echo "No ycmd"
  #echo "Provision Ycmd"
  #cd ~/git && git clone https://github.com/Valloric/ycmd.git
fi


# an example
# --------------------

#rm -r ~/.emacs.d/private
#git clone git@github.com:tigersoldier/dotspacemacs.git ~/.emacs.d/private
#rm ~/.spacemacs && ln -s ~/.emacs.d/private/init.el ~/.spacemacs

# 2 

#rm -r ~/.emacs.d/private && rm ~/.spacemacs
#ln -s ~/repos/Config/home/.spacemacs ~/.spacemacs
#ln -s ~/repos/Config/home/.emacs.d/private ~/.emacs.d/private

# Evil 

echo ""
echo " ---------------------------------------"
echo "         Start running Emacs "
echo " ---------------------------------------"

#emacs-snapshot &
emacs &
#sleep 245; cd ~/.emacs.d/elpa/develop/alect-themes* && wget https://raw.githubusercontent.com/cbowdon/geeko-theme/master/geeko-theme.el
#cd ~/.emacs.d/elpa/develop/melancholy-theme* && sed -i.bak s/:height\ 160//g melancholy-theme.el

