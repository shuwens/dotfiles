alias c4='c4.millennium.berkeley.edu'
alias c7='c7.millennium.berkeley.edu'
alias c8='c8.millennium.berkeley.edu'
alias make='colormake'

export PYTHONPATH=$PYTHON_PATH:/usr/lib/python2.6/site-packages/xen:/usr/lib/python/xen
export SVN_EDITOR=vim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/usr/bin/vim

RCLUSTER=r22.millennium.berkeley.edu,r24.millennium.berkeley.edu,r25.millennium.berkeley.edu,r26.millennium.berkeley.edu,r27.millennium.berkeley.edu,r28.millennium.berkeley.edu,r29.millennium.berkeley.edu,r30.millennium.berkeley.edu,r31.millennium.berkeley.edu


HISTSIZE=100000
HISTFILESIZE=100000


PATH=$PATH::~/tools:~/ruby/bin:~/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11:/usr/mill/bin:/usr/pbs/bin:/home/eecs/justine/tools:/home/eecs/justine/tools:/usr/local/bin:/usr/sww/bin:~/bin:/Users/justine/Documents/work/repo/tools:/Users/justine/.gem/ruby/1.8/bin:/Users/justine/Documents/work/adt-bundle-mac-x86_64-20130219/sdk/platform-tools

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;31m\]\u\[\033[0;34m\]@\h\[\033[00m\]:\[\033[0;37m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Colin Scott's aliases and variables
# Feel free to delete these if they bother you
export RI="--format ansi --width 75"
export LESS="-R"
alias less="less -R"
alias q=exit
alias c=clear
alias pl1="ssh  -l uw_revtr2 planetlab01.cs.washington.edu"
alias pl2="ssh  -l uw_revtr2 planetlab02.cs.washington.edu"
alias pl3="ssh  -l uw_revtr2 planetlab03.cs.washington.edu"
alias pl4="ssh  -l uw_revtr2 planetlab04.cs.washington.edu"
alias pl5="ssh  -l uw_revtr2 planetlab05.cs.washington.edu"
export PATH="~/ruby/bin:$PATH"

set -o emacs

# Ashoat's stuff
alias mysql="mysql -D revtr -p"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH=/usr/local/bin:$PATH
export TERM=xterm

# If not running interactively, don't do anything
case $- in
      *i*) source ~/.bashrc.jon;;
            *) source ~/.bashrc.def;;
          esac
