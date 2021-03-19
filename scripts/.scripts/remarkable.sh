#!/bin/bash
# set -x

cp ~/dev/achtung/nfv/src/paper.pdf ~/Downloads/pvn/paper_$(date +"%Y-%m-%d--%H:%M").pdf

cd ~/Downloads/pvn
echo -e "mput pvn" | rmapi

cd ~/Downloads/tr
echo -e "mput ToRead" | rmapi

