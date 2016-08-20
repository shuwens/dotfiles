#
# @file: ~/.bashrc
#
# @author: Jethro Shuwen Sun

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General settings

alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias ls='ls --color=auto'
alias ..="cd .."
alias cls="clear && ls"
alias sduo="sudo"
alias GIT=' git commit -m "`curl -s http://whatthecommit.com/index.txt`" &&  git push '
alias gits="git status"
alias glog="git log --pretty=oneline --abbrev-commit"
alias workon="source .venv/bin/activate"
alias workoff='deactivate'

# Handy functions
function sr {
    find . -type f -exec sed -i '' s/$1/$2/g {} +
}

function sc {
    kate ~/Dropbox/org/$(openssl rand -base64 10 | tr -dc 'a-zA-Z').rst
}

function crs {
    kate ~/Dropbox/org/critical-reviews/$(openssl rand -base64 10 | tr -dc 'a-zA-Z').rst
}

function gitup () {
        if [ -d ".git" ]
        then
                echo "git pull origin"
                git pull origin
        elif [ -d ".svn" ]
        then
                echo "svn up"
                svn up
        elif [ -d ".hg" ]
        then
                echo "hg pull"
                hg pull
                echo "hg update"
                hg update
        else
                echo "Bad repository!"
        fi
}

#
#  My set of bash
#
alias e="emacsclient -nw "
alias org="cd ~/Dropbox/org/"
alias writealgs="cd ~/coding/algs/ada-2/"
#alias uem="emacs -Q -l ~/.uemacs.d/init.el"
#alias crs="cd ~/Dropbox/critical-reviews"
alias lc="sh ~/bin/comments.sh"

# use thefuck
eval $(thefuck --alias)

# for learning K&R2
alias cc="gcc -g -Wall -std=gnu99"
#alias cc="gcc -W -Wall -ansi -pedantic"

#alias qemuserver="qemu-system-i386 --enable-kvm ~/VirtualBox\ VMs/ubuntu/ubuntu.vdi -m 2048"
#alias qemu552="qemu-system-i386 --enable-kvm ~/Downloads/vms/cs552.vdi -m 1024"

alias update="echo \"\" ; echo \"   --- Personal utils: pacman & yaourt update ---\" ; echo \"\" ; sudo pacman -Syu ; echo \"\" ; sudo yaourt -Syu; echo \"\""
alias blog-creat="cp ~/git/chrisblog/else/template "
alias blog="cd ~/git/chrisblog/_posts/2016"
alias apiload="scp ~/coding/haas/haas/api.py shwsun@devhaas:~/api.py; scp ~/coding/haas/haas/cli.py shwsun@devhaas:~/cli.py"
alias cmacs="emacs -Q -l ~/working/emacs-ide/init.el"

export VISUAL="vim"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\u@\h: \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]]$ "

# end of [~/.bashrc]
