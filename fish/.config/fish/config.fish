# -----------------------------------
#
#       My Fish Shell Config
# -----------------------------------

# # let me get my stuff
[ -f ~/.config/fish/functions/aliases.fish ]; and source ~/.config/fish/functions/aliases.fish
# #. ~/.config/fish/security.fish
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
[ -f $HOME/.autojump/share/autojump/autojump.fish ]; and source $HOME/.autojump/share/autojump/autojump.fish
#
# ## let's setup path variable
# # set -e fish_user_paths
# set --universal FONTCONFIG_PATH /etc/fonts/
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -U fish_user_paths /Users/jethros/.npm-packages/bin $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

# the right tmux setup in fish
if status --is-interactive
    tmux ^/dev/null; and exec true
end

# systems update
if test (uname) = Darwin
    abbr -a -U p echo "what r you tring to do?"
    abbr -a -U up brew update
    abbr -a -U update brew update
    abbr -a -U upgrade brew upgrade
    abbr -a -U o open
    abbr -a -U w wget
    abbr -a -U emacs emacs -nw
else
    if [ -e /usr/bin/apt ]
	# ubuntu systems
	abbr -a p 'sudo apt'
	abbr -a up 'sudo apt update; and sudo apt list --upgradable'
	#set -U fish_user_abbreviations $fish_user_abbreviations 'o=xdg-open'
	function upgrade
	    echo (pass x1c/jethros) | sudo -S apt -y upgrade
	end
    else if [ -e /usr/bin/yaourt ]
	# arch systems w/ yaourt
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=yaourt'
	#complete --command yaourt --wraps pacman
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=yaourt -Syu --aur'
    else if [ -e /usr/bin/pacman]
	# native arch systems
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=sudo pacman'
	#set -U fish_user_abbreviations $fish_user_abbreviations 'up=sudo pacman -Syu'
    else if [ -e /usr/bin/pacaur ]
	# arch systems w/ pacaur
	#complete --command pacaur --wraps pacman
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=pacaur'
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=pacaur -Syu'
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

if [ -e /usr/local/bin/exa ]
    abbr -a -U ls exa
    abbr -a -U la exa -a
    abbr -a -U ll exa -l --git
    abbr -a -U lll exa -la --git
else if [ -e $HOME/.cargo/bin/exa ]
    abbr -a -U ls exa
    abbr -a -U la 'exa -a'
    abbr -a -U ll 'exa -l'
    abbr -a -U lll 'exa -la'
else
    abbr -a -U l 'ls'
    abbr -a -U ll 'ls -l'
    abbr -a -U lll 'ls -la'
end

# Add ssh identity, silently

# macOS is now very annoying...
if test (uname) = Darwin
    # gnupg.fish
    #
    # Start or re-use a gpg-agent.
    #
    gpgconf --launch gpg-agent

    # Ensure that GPG Agent is used as the SSH agent
    set -e SSH_AUTH_SOCK
    set -U -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
    #
    # another way
    # set GPG_TTY (tty)
    # set SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

    # add alias for ssh to update the tty
    # alias ssh "gpg-connect-agent updatestartuptty /bye >/dev/null; ssh"
else
    ssh-add -K 2>/dev/null
end


# fzf
set PATH $PATH $HOME/.fzf/bin
setenv FZF_DEFAULT_OPTS '--height 20%'

if [ -e $HOME/.fzf/shell/key-bindings.fish ]; and status --is-interactive
    . $HOME/.fzf/shell/key-bindings.fish
end

if test (uname) = Darwin
    setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
    setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
else
    setenv FZF_DEFAULT_COMMAND 'ag -g ""'
    setenv FZF_CTRL_T_COMMAND 'ag -g ""'
end

function fish_user_key_bindings
    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
	fzf_key_bindings
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

## PATH variables
# ---------------
if test (uname) = Darwin
    set PATH /usr/local/bin/ $PATH
    set PATH $PATH /Applications/MATLAB_R2018b.app/bin
    set PATH $PATH ~/bin
    set PATH $PATH $HOME/.cargo/bin
    set PATH $PATH /Users/jethros/.gem/ruby/2.6.0/bin
else
    set PATH /usr/local/bin/ $PATH
    set PATH $PATH ~/bin
    set PATH $PATH ~/.local/bin
    set PATH $PATH ~/.cargo/bin
    set PATH $PATH /home/linuxbrew/.linuxbrew/bin
    set PATH $PATH $NPM_PACKAGES/bin
    set PATH $PATH ~/.local/share/umake/bin
    set PATH $PATH ~/dev/r/bin
    set PATH $PATH $HOME/.fzf/bin
end

if test -e $HOME/data/cargo-target
    setenv CARGO_TARGET_DIR $HOME/data/cargo-target
end

# setenv INFOPATH "mkdir -p ~/.local/share/eless/info"

# # For RLS
# # https://github.com/fish-shell/fish-shell/issues/2456
# setenv LD_LIBRARY_PATH (rustc --print sysroot)"/lib:$LD_LIBRARY_PATH"
# setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
# setenv TZ ":/etc/localtime"

# See https://github.com/fish-shell/fish-shell/issues/772
# set FISH_CLIPBOARD_CMD "cat"

# # Base16 Shell
# if status --is-interactive
#     set BASE16_SHELL "$HOME/dev/others/base16/shell"
#     source "$BASE16_SHELL/profile_helper.fish"
# end

# Add pyenv, if available
if test -d "$HOME/.pyenv"
    # set where pyenv is installed
    set -x PYENV_ROOT $HOME/.pyenv
    # Disable prompt as it's been removed
    set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
    set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
    # Set virtualenvs to be located in one place
    set -x WORKON_HOME $HOME/.ve
    # Set virtualenv projects in one place
    set -x PROJECT_HOME $HOME/p
    # Add pyenv root to PATH to access its shims
    set -xg PATH $PYENV_ROOT/bin $PATH
    # load pyenv and virtualenv-init, etc
    status --is-interactive; and pyenv init - | source
end

# # Pretty ls colors
# if test -e $HOME/.dircolors
#     if test (uname) = Darwin
#         setenv LS_COLORS (bash --noprofile -c 'eval "$(gdircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
# else
#     setenv LS_COLORS (bash --noprofile -c 'eval "$(dircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
# end
# end
#
# if type -q hub
#     # alias g hub
#     complete --command hub --wraps git
#     complete --command g --wraps hub
# else
#     # alias g git
#     complete --command g --wraps git
# end


function fish_greeting
    echo
    if test (uname) = Darwin
	echo -e (uname -sr | awk '{print " \\\\e[1mOS:  \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime  | sed 's/^up //' | awk '{print " \\\\e[1mUptime:  \\\\e[0;32m"$0"\\\\e[0m"}')
    else
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
    end
    echo -e (uname -n | awk '{print " \\\\e[1mHostname:  \\\\e[0;32m"$0"\\\\e[0m"}')

    # Disk usage
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
	df -l -h | grep -E 'dev/(xvda|sd|mapper)' | \
	awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
	sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
	paste -sd ''\
	)
    end
    echo

    # Network
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
	echo
    else
	echo
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
	#column -t -R1 | \
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
	# echo "    [CFP] SIGCOMM 2020 DDL: Jan 31, 2020"
	echo "    [CFP] NSDI 2021 DDL: March 15, 2021"
	#echo "    [PVN] Design, Architecture and Prototype"
	echo "    [Blog #1] dev: mostly vim and Rust programming setup"
	echo "    [Blog #2] My Rust learning experience"
	echo "    [Blog #3] Year one experience as a PhD"
	echo "    [Blog #4] Tracing in Rust"
	echo "    [After NSDI ddl] Leetcode in Rust"
	echo "    [After NSDI ddl] Rust 101 by Ralf Jung"
    end
    if [ $r -lt 35 ]
	# less important and urgent
	set_color green
	# echo "    [project] <description>"
	echo "    [Research] Organize long paper idea"
	echo "    [NetBricks] Clean the wiki pages"
	echo "    [SIGCOMM 15] Get the papers and public reviews"
    end
    if [ $r -lt 65 ]
	# important but not urgent things, note that these are the things I
	# work on every morning
	set_color yellow
	echo "    [Submission] NSDI 2021 DDL: Sept 17"
	echo "    [Submission] CoNEXT 2020 DDL: June 24"
    end
    # important and urgent things, so I should get to it right away
    set_color red
    echo "    [CoNEXT 20] Writing: background and motivation"
    echo "    [CoNEXT 20] Impl and running expr"
    # echo "    [NSDI 21] Survey: CoNEXT, SIGCOMM, NSDI"


    echo
    set_color normal
end

# end of [fish/config.fish]
