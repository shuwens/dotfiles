#!/bin/bash 

tmux new -stest \; \
  new-window -n vim \; \
  new-window -n guard \; \
  new-window -n console/server
select-window -t 3 \; \
  send-keys -t 3 'fish' Enter
