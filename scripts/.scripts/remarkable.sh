#!/bin/bash
# set -x
# /home/jethros/dev/achtung/survey/src
cp ~/dev/achtung/survey/src/paper.pdf ~/Downloads/remarkable/pvn/paper_$(date +"%Y-%m-%d--%H:%M").pdf

cp ~/dev/achtung/audit/paper.pdf ~/Downloads/remarkable/pvn2/paper_$(date +"%Y-%m-%d--%H:%M").pdf

cd ~/Downloads/remarkable/pvn
echo -e "mput pvn1" | rmapi

cd ~/Downloads/remarkable/pvn2
echo -e "mput pvn2" | rmapi

cd ~/Downloads/remarkable/tr
echo -e "mput ToRead" | rmapi

