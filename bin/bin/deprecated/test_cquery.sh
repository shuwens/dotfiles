#!/bin/bash

git clone  https://github.com/cormacc/spacemacs.git -b lsp-layer-improvements ~/repos/space/new-lsp
rm -rf ~/.emacs.d/layers/+tools/cquery
cd ~/.emacs.d/layers/+tools/ && cp -r ~/repos/space/new-lsp/layers/+tools/lsp .


git clone  https://github.com/cormacc/spacemacs.git -b new-cquery-layer  ~/repos/space/cquery
rm -rf ~/.emacs.d/layers/+tools/lsp
cd ~/.emacs.d/layers/+tools/ && cp -r ~/repos/space/cquery/layers/+tools/cquery .

# Handle Ycmd if not exist
#if [ -d "$YCMD_DIR" ]; then
if [ -d $YCMD_DIR ]; then echo 'Ycmd Exists'; else
  echo "No ycmd"
  #echo "Provision Ycmd"
  #cd ~/git && git clone https://github.com/Valloric/ycmd.git
fi

