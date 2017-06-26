#                 ██
#                ░██
#  ██████  ██████░██
# ░░░░██  ██░░░░ ░██████
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ aliases
alias ll="ls -lahF --color=auto"
alias ls="ls -hF --color=auto"
alias la="ls -a"
alias lsl="ls -lhF --color=auto"
alias sduo="sudo"
alias "cd.."="cd ../"
alias up="cd ../"
alias rmrf="rm -rf"
alias psef="ps -ef"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias scp="scp -r"
alias xsel="xsel -b"
#alias fuck='sudo $(fc -ln -1)'

alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias rock="ncmpcpp"
alias mixer="alsamixer"
alias genplaylist="cd ~/music;find . -name '*.mp3' -o -name '*.flac'|sed -e 's%^./%%g' > ~/.mpd/playlists/all.m3u"
alias matrix="cmatrix -b"
alias tempwatch="while :; do sensors; sleep 1 && clear; done;"
alias term="urxvtc -hold -e " #used for run menu
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
alias lol="base64 </dev/urandom | lolcat"
alias apt="sudo apt"
#alias update="sudo apt update "   #"pacman-colors && yaourt -Syua"
alias docker="sudo docker"
alias systemctl="sudo systemctl"
alias :q="sudo reboot"
alias ZZ="quit"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'
#alias todo="bash ~/code/sys/todo"
alias todo="head -10 ~/.todo"
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" #pass a filename
alias nexus="jmtpfs ~/nexus"
alias ChangeT="sudo update-alternatives --config x-terminal-emulator"
tmx() {
  [[ $# -eq 0 ]] && bash ~/bin/tmx 0 || bash ~/bin/tmx $#
}
email() {
  echo $3 | mutt -s $2 $1
}
# colorized cat
c() {
  for file in "$@"
  do
    pygmentize -O style=sourcerer -f console256 -g "$file"
  done
}
# colorized less
lesssss() {
  pygmentize -O style=sourcerer -f console256 -g $1 | less -r
}
# read markdown files like manpages
md() {
  pandoc -s -f markdown -t man "$*" | man -l -
}
# nullpointer url shortener
short() {
  curl -F"shorten=$*" https://0x0.st
}

# Add linux kernel dev aliaes
alias gl="git log --pretty=oneline --abbrev-commit"

# ------------------------------
# personal utils
# ------------------------------
alias UpdateResume="scp ~/Documents/my_cv/sun_cv.pdf shwsun@csa2.bu.edu:~/public_html/resrcs"
alias leet="./~/workspace/practise-cpp/leetcode/comments.sh"
alias virtualenv3="virtualenv -p /usr/bin/python3 .venv"


# careful! bugs!
# alias scrape="wget -A pdf,jpg -m -p -E -k -K -np "
# Docker stuff
# alias Docker-clean="docker rm $(docker ps -a -q) && docker rmi $(docker images -q)"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...="cd ..."
alias sduo="sudo"

#
alias Cl="rm -rf \~"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias workon="source .venv/bin/activate"
alias walkaway="deactivate"
alias jn="jupyter notebook"
alias F="thunar ."
alias cls="clear"
alias vi="vim"
alias ee="emacsclient"

# grep and find
#alias g="grep --color=autp -ri"
alias grep="grep --color=auto"
#alias finp="f() {find "$1" -iname "${@:2}"};f"
#alias cfinp="f() {find . -iname "${@:2}"};f"
#alias fin="f() {find "$1" -iname "*${@:2}*"};f"
#alias cfin="f() {find . -iname "*${@:1}*"};f"
#alias rgp="f() {rg -p "$@" | less -r};f"

# for zsh
alias Z="zsh"
alias Ea="vim ~/.zsh/aliases.zsh"
alias Ez="vim ~/.zsh/environment.zsh"
alias Eg="source ~/.zgoogle"

# git alias
alias gits="git status"
alias gs="git status"
alias gb="git branch"
alias gl="git log --graph --decorate --oneline"
alias lazy="git add -A && git commit -m 'Update some files' && git push "
# ========================================================
#alias gc="git checkout"

#alias gs='git status -s'
#alias ca='git commit -a -m'

alias gcb="git checkout -b"
alias ga="git add"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gl="git log --graph --decorate --oneline"
#alias g="hub"
#alias gc="git commit -m"
alias gc="git clone"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git graph"
alias gco="git checkout"
alias gpr="hub pull-request"

# workon
alias hack-n-hil="ssh hack-n-hil.prb.massopencloud.org"
alias haas-beta="ssh haas-beta.prb.massopencloud.org"

# t-tasks
alias t='python ~/Public/t/t.py --task-dir ~/Public/tasks --list tasks'

# ubuntu special
alias open="gnome-open"

# dropbox shortcut
alias StatDropbox="~/.dropbox/dropbox.py status"

# utils
alias Docker-clean="docker ps --filter 'status=exited' | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm"


# ----------------------------------
# Compiling stuff
# ----------------------------------
alias ghcd="ghc -dynamic"
alias g11='g++ -std=c++11 -O2'
alias g+="g++ -std=gnu++11 -Wall -Wextra -g"


#----------------------------------
# stuff from oh-my-zsh
#----------------------------------
alias ta="tmux attach -t"
alias tad="tmux attach -d -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"

# jonhoo

# make less better
# X = leave content on-screen
# F = quit automatically if less than one screenfull
# R = raw terminal characters (fixes git diff)
#     see http://jugglingbits.wordpress.com/2010/03/24/a-better-less-playing-nice-with-git/
export LESS="-F -X -R"

# Color aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mplayer='mplayer -msgcolor'
# Common aliases
alias more='less'
# Convenience aliases
alias lll='ls -la'
alias ll='ls -l'
alias l='ls'
alias run='sudo systemctl start'
alias restart='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias x='sudo netctl'
#alias gc='git checkout'
alias xt='date +%s'
alias ..='cd ..'
# make
alias ,='make'
# file handlers
#alias o='xdg-open'
o() { xdg-open "$@" & }
#alias Disk-Usage="du -cBM --max-depth=1 2> >(grep -v 'Permission denied') | sort -n | grep G"
alias Disk-Usage='du -h --max-depth=3 | grep G'

if [ -e /usr/bin/yaourt ]; then
  alias up="yaourt -Syu --aur"
else
  alias up="sudo pacman -Syu"
fi
# editing
alias e='$EDITOR'
# Safety first
alias mv='mv -i'

# Type - to move up to top parent dir which is a repository
function - {
local p=""
for f in `pwd | tr '/' ' '`; do
  p="$p/$f"
  if [ -e "$p/.git" ]; then
    cd "$p"
    break
  fi
done
}
# Replace part of current path and cd to it
function cdd {
  cd `pwd | sed "s/$1/$2/"`
}

# haskell vim
alias hvim="vim -u ~/.config/haskell-vim-now/.vimrc" 

alias WgetScrape="wget -A pdf -m -p -E -k -K -np"

# end of [aliases.zsh]
