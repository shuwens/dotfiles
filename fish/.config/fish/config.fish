#
#       My Fish Shell Config
#

## PATH variables
# ---------------
if test (uname) = Darwin
    set PATH /opt/homebrew/bin/ $PATH
    set PATH /usr/local/bin/ $PATH
    set PATH $PATH /Applications/MATLAB_R2018b.app/bin
    set PATH $PATH ~/bin
    set PATH $PATH $HOME/.cargo/bin
    set PATH $PATH /Users/jethros/.gem/ruby/2.6.0/bin
    set PATH $PATH /Users/jethros/.rvm/scripts/rvm
    set PATH $PATH /Library/TeX/texbin
else
    set PATH /usr/local/bin/ $PATH
    set PATH $PATH ~/bin
    set PATH $PATH ~/.scripts
    set PATH $PATH ~/.local/bin
    set PATH $PATH ~/.cargo/bin
    set PATH $PATH $NPM_PACKAGES/bin
    set PATH $PATH ~/.local/share/umake/bin
    set PATH $PATH $HOME/.fzf/bin
end

# Add ssh identity, silently

# macOS is now very annoying...
if test (uname) = Darwin
    # gnupg.fish
    #
    # Start or re-use a gpg-agent.
    #
    #gpgconf --launch gpg-agent

    # Ensure that GPG Agent is used as the SSH agent
    set -e SSH_AUTH_SOCK
    set  -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
    #
    # another way
    # set GPG_TTY (tty)
    # set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

    # add alias for ssh to update the tty
    # alias ssh "gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
else
    # ssh-add -K 2>/dev/null
end

if test -e $HOME/data/cargo-target
    setenv CARGO_TARGET_DIR $HOME/data/cargo-target
end

setenv NVIM_HOME $HOME/.config/nvim
# setenv INFOPATH "mkdir -p ~/.local/share/eless/info"

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
# setenv TZ ":/etc/localtime"

# See https://github.com/fish-shell/fish-shell/issues/772
# set FISH_CLIPBOARD_CMD "cat"

# Add pyenv, if available
if test -d "$HOME/.pyenv"
    setenv PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    status --is-interactive; and pyenv virtualenv-init - | source
    # status is-login; and pyenv init --path | source
    pyenv init - | source
end

# fzf
set PATH $PATH $HOME/.fzf/bin
setenv FZF_DEFAULT_OPTS '--height 20%'

# Java
set --export JAVA_HOME (dirname (dirname (readlink -f (which java))))
set -gx PATH $JAVA_HOME $PATH

if test (uname) = Darwin
    fish_add_path /usr/local/sbin
    fish_add_path /usr/local/opt/node@16/bin
    setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
    setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
else
    fish_add_path ~/.local/bin
    setenv FZF_DEFAULT_COMMAND 'ag -g ""'
    setenv FZF_CTRL_T_COMMAND 'ag -g ""'
end

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end
end

source ~/.config/fish/functions/aliases.fish
if test -d "$HOME/.fzf"
    . $HOME/.fzf/shell/key-bindings.fish
end

# the right tmux setup in fish
if status --is-interactive
    # GPG
    # set -x GPG_TTY (tty)
    # set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    # gpgconf --launch gpg-agent

    # Base16 Shell
    # if test -d ~/dev/others/base16/fish-shell
    #     set fish_function_path $fish_function_path ~/dev/others/base16/fish-shell/functions
    #     builtin source ~/dev/others/base16/fish-shell/conf.d/base16.fish
    # end
    if ! set -q TMUX
        exec tmux
    end
end

# systems update
if test (uname) = Darwin
    abbr -a  p echo "what r you tring to do?"
    abbr -a  up brew update
    abbr -a  update brew update
    abbr -a  upgrade brew upgrade
    abbr -a  o open
    abbr -a  w wget
    abbr -a  emacs emacs -nw
    abbr -a  jn "jupyter notebook --browser=firefox"
else
    abbr -a  jn 'jupyter notebook --browser="firefox-developer-edition %s"'
    if [ -e /usr/bin/apt ]
        # ubuntu systems
        abbr -a p 'sudo apt'
        abbr -a up 'sudo apt update; and sudo apt list --upgradable'
        #set  fish_user_abbreviations $fish_user_abbreviations 'o=xdg-open'
        function upgrade
            echo (pass x1c/jethros) | sudo -S apt -y upgrade
        end
    else if [ -e /usr/bin/aurman ]
        complete --command aurman --wraps pacman
        # native arch systems
        abbr -a p 'aurman'
        abbr -a up 'aurman -Syu'
    else if [ -e /usr/bin/yay ]
        # arch systems w/ yaourt
        complete --command yay --wraps pacman
        abbr -a  p yay
        abbr -a  up 'yay -Syyu'
    else if [ -e /usr/bin/paru ]
        # native arch systems
        abbr -a  p 'sudo paru'
        abbr -a  up 'sudo paru -Syu'
    else if [ -e /usr/bin/pacman ]
        # native arch systems
        abbr -a  p 'sudo pacman'
        abbr -a  up 'sudo pacman -Syu'
    else
        echo "you are not running a recognizable system!"
end

function ssh
    switch $argv[1]
        case "*.amazonaws.com"
            env TERM=xterm /usr/bin/ssh $argv
        case "ubuntu@"
            env TERM=xterm /usr/bin/ssh $argv
        case "*"
            /usr/bin/ssh -X $argv
        end
    end
end

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
function j -d "Autojump alias" -w "autojump"
    cd (env AUTOJUMP_SOURCED=1 autojump $argv)
end

# Type - to move up to top parent dir which is a repository
function d
    while test $PWD != "/"
        if test -d .git
            break
        end
        cd ..
    end
end

set FORTUNES computers debian linux magic
set FORTUNES futurama hitchhiker $FORTUNES
set FORTUNES firefly calvin perl $FORTUNES
set FORTUNES science wisdom miscellaneous $FORTUNES
set FORTUNES off/atheism off/debian off/linux off/privates $FORTUNES
set FORTUNES off/religion off/vulgarity $FORTUNES

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

## Variables setting
setenv EDITOR nvim
# setenv BROWSER firefox-developer-edition
setenv BROWSER firefox
setenv EMAIL sun.shuw@northeastern.edu
setenv NAME "Shuwen Jethro Sun"
setenv GOPATH "$HOME/data/r"
setenv RUST_BACKTRACE 1
setenv CARGO_INCREMENTAL 1
setenv RUSTFLAGS "-C target-cpu=native -C codegen-units=4"
setenv WINEDEBUG fixme-all
setenv ZK_NOTEBOOK_DIR "$HOME/Dropbox/org/zk_notebook"
setenv DOOMDIR "$HOME/.config/doom"


# # Pretty ls colors
if test -e $HOME/.dircolors
    if test (uname) = Darwin
        # setenv LS_COLORS (bash --noprofile -c 'eval "$(gdircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
        setenv LS_COLORS (bash --noprofile -c 'test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)')
    else
        eval ( dircolors --c-shell $HOME/.dircolors )
    end
end

function fish_greeting
    echo
    if test (uname) = Darwin
        echo -e (uname -sr | awk '{print " \\\\e[1mOS:  \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e (uptime  | sed 's/^up //' | awk '{print " \\\\e[1mUptime:  \\\\e[0;32m"$0"\\\\e[0m"}')
    else
        echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
    end
    echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e " \\e[1mDisk usage:\\e[0m"
    echo

    if test (uname) = Darwin
        echo -ne (\
            df -l -h | grep -E 'dev' | \
            awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $1, $3, $2, $5}' | \
            sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
            paste -sd\\ - \
        )
    else
        echo -ne (\
            df -l -h | grep -E 'dev/(xvda|sd|mapper|nvme)' | \
            awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
            sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
            paste -sd ''\
        )
    end
    echo

    echo -e " \\e[1mNetwork:\\e[0m"
    echo
    if test (uname) = Darwin
        echo -ne "       "
        echo -ne (\
        networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}' \
        )
        echo -ne ": "
        echo -ne (\
        ipconfig  getifaddr (networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}') \
        )
    else
        # http://tdt.rocks/linux_network_interface_naming.html
        echo -ne (\
            ip addr show up scope global | \
            grep -E ': <|inet' | \
            sed \
                -e 's/^[[:digit:]]\+: //' \
                -e 's/: <.*//' \
                -e 's/.*inet[[:digit:]]* //' \
                -e 's/\/.*//'| \
            awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
            sort | \
            column -t -R1 | \
            # public addresses are underlined for visibility \
            sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
            # private addresses are not \
            sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
            # unknown interfaces are cyan \
            sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
            # ethernet interfaces are normal \
            sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
            # wireless interfaces are purple \
            sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
            # wwan interfaces are yellow \
            sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
            sed 's/$/\\\e[0m/' | \
            sed 's/^/\t/' \
        )
    end
    echo

    set r (random 0 100)
    set_color normal
    echo -e " \e[1mTODOs\e[0;32m"
    echo
    if [ $r -lt 15 ]
        # least important and urgent, remind me occasionally
        set_color cyan
        # echo "    [project] <description>"
    end
    if [ $r -lt 35 ]
        # less important and urgent
        set_color green
        # echo "    [project] <description>"
    end
    if [ $r -lt 65 ]
        # important but not urgent things, note that these are the things I
        # work on every morning
        set_color yellow
    end
    # important and urgent things, so I should get to it right away
    set_color red

    echo
    set_color normal
end

# end of [fish/config.fish]

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/shwsun/tools/miniconda/bin/conda
    eval /Users/shwsun/tools/miniconda/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
