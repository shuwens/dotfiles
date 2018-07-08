#!/bin/bash

# https://github.com/swaroopch/flask-boilerplate
BASE="$HOME/dev/"
cd $BASE

# the name of your primary tmux session
SESSION=foo
# your IRC nickname
IRC_NICK=$USER
tmux start-server
tmux new-session -d -s foo
tmux new-window -t foo:1
tmux new-window -t foo:2
#tmux new-window -t foo:3
#tmux new-window -t flaskboilerplate:4 -n console
#tmux new-window -t flaskboilerplate:5 -n tests
#tmux new-window -t flaskboilerplate:6 -n git


tmux send-keys -t foo:0 " fish " C-m
tmux send-keys -t foo:2 " fish " C-m

#tmux send-keys -t flaskboilerplate:2 "cd $BASE/flask_application/controllers; ls" C-m
#tmux send-keys -t flaskboilerplate:3 "cd $BASE/flask_application/templates; ls" C-m
#tmux send-keys -t flaskboilerplate:4 "bpython -i play.py" C-m
#tmux send-keys -t flaskboilerplate:5 "python tests.py" C-m
#tmux send-keys -t flaskboilerplate:6 "git status" C-m

tmux select-window -t $SESSION:0
tmux -2 attach -t $SESSION
