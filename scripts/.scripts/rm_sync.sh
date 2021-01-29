#!/bin/bash
# set -x

cp ~/dev/achtung/nfv/paper.pdf ~/Downloads/pvn/paper_$(date +"%Y-%m-%d--%H:%M").pdf


cd ~/Downloads/pvn

# echo -e "cd books\nput new_book.pdf" | rmapi
echo -e "mput pvn" | rmapi
