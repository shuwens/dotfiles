#!/bin/bash
# set -x
# /home/jethros/dev/achtung/survey/src

cp ~/dev/achtung/survey/src/paper.pdf ~/Downloads/pvn/paper_$(date +"%Y-%m-%d--%H:%M").pdf

cd ~/Downloads/pvn
echo -e "mput pvn2" | rmapi

cd ~/Downloads/tr
echo -e "mput ToRead" | rmapi

