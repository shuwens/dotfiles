#!/bin/bash

stow bash        -t ~
stow fish        -t ~
stow bin         -t ~
stow scripts	 -t ~
stow mac         -t ~
stow zk		  -t ~
stow -t ~   spacemacs

cd config || exit
stow -t ~/.config  .config

