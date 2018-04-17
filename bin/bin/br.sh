#!/bin/sh
#set -x

SESSION_NAME="universe"


#cd ~/Sites/within3/big_red

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]; then
  echo "Creating the session"

  # Create the session
  tmux new-session -s ${SESSION_NAME} -n foo -d

  # First window (0) -- vim and console
  tmux send-keys -t ${SESSION_NAME} 'fish' C-m

  # shell (1)
  tmux new-window -n bar -t ${SESSION_NAME}
  #tmux send-keys -t ${SESSION_NAME}:1 'git status' C-m

  # mysql (2)
  tmux new-window -n workspace -t ${SESSION_NAME}
  tmux send-keys -t ${SESSION_NAME}:2 'fish' C-m

  # server/debug log (3)
  tmux new-window -n server -t ${SESSION_NAME}
  #tmux send-keys -t ${SESSION_NAME}:3 'tail -f log/development.log | grep "DEBUG"' C-m
  tmux send-keys -t ${SESSION_NAME}:3 'neofetch' C-m
  tmux split-window -v -t ${SESSION_NAME}:3
  tmux send-keys -t ${SESSION_NAME}:3.1 'sleep 42 ; ssh bucs' C-m

  # rails console (4)
  #tmux new-window -n console -t ${SESSION_NAME}
  #tmux send-keys -t ${SESSION_NAME}:4 'pry -r ./config/environment' C-m

  # Start out on the first window when we attach
  tmux select-window -t ${SESSION_NAME}:0
fi

#tmux -2 attach-session -d -t ${SESSION_NAME}
tmux attach -t ${SESSION_NAME}
