#
#       My Fish Shell Config
# -----------------------------------

## let me get my stuff
[ -f ~/.config/fish/aliases.fish ]; and source ~/.config/fish/aliases.fish
#. ~/.config/fish/security.fish
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -U fish_user_abbreviations
set -U fish_user_abbreviations $fish_user_abbreviations 'gc=git clone'
set -U fish_user_abbreviations $fish_user_abbreviations 'gc=git clone'
set -U fish_user_abbreviations $fish_user_abbreviations 'vimdiff=nvim -d'
set -U fish_user_abbreviations $fish_user_abbreviations 'clippy=cargo-clippy'
set -U fish_user_abbreviations $fish_user_abbreviations 'cargot=cargo t'
set -U fish_user_abbreviations $fish_user_abbreviations 'vim=nvim'
set -U fish_user_abbreviations $fish_user_abbreviations 'sduo=sudo'
set -U fish_user_abbreviations $fish_user_abbreviations 'vi=nvim'
set -U fish_user_abbreviations $fish_user_abbreviations 'jn=jupyter notebook'
#set -U fish_user_abbreviations $fish_user_abbreviations 'emacs=emacs set --dump-file ~/.emacs.d/.cache/dumps/spacemacs.pdmp'
complete --command yaourt --wraps pacman
complete --command pacaur --wraps pacman

## let's setup path variable
set --universal FONTCONFIG_PATH /etc/fonts/

set -U fish_prompt_pwd_dir_length 3

# ??? to blame
if status --is-interactive
	tmux ^ /dev/null; and exec true
end

# systems update
if test (uname) = Darwin
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=echo "what r you tring to do?"'
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=brew update'
	set -U fish_user_abbreviations $fish_user_abbreviations 'upgrade=brew upgrade'
	set -U fish_user_abbreviations $fish_user_abbreviations 'o=open'
else
	if [ -e /usr/bin/apt ]
		# ubuntu systems
		set -U fish_user_abbreviations $fish_user_abbreviations 'p=sudo apt'
		set -U fish_user_abbreviations $fish_user_abbreviations 'up=sudo apt update; and sudo apt list --upgradable'

		#set -U fish_user_abbreviations $fish_user_abbreviations 'o=xdg-open'
		function upgrade
			echo (pass x1c/jethros) | sudo -S apt -y upgrade
end 
else if [ -e /usr/bin/yaourt ]
	# arch systems w/ yaourt
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=yaourt'
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=yaourt -Syu --aur'
else if [ -e /usr/bin/pacman]
	# native arch systems
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=sudo pacman'
	#set -U fish_user_abbreviations $fish_user_abbreviations 'up=sudo pacman -Syu'
else if [ -e /usr/bin/pacaur ]
	# arch systems w/ pacaur
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=pacaur'
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=pacaur -Syu'
else
	echo "you are not running a recognizable system!"
end
end 

if [ -e ~/.cargo/bin/exa ]
	set -U fish_user_abbreviations $fish_user_abbreviations 'ls=exa'
	set -U fish_user_abbreviations $fish_user_abbreviations 'll=exa -l'
	set -U fish_user_abbreviations $fish_user_abbreviations 'lll=exa -la'
else
	set -U fish_user_abbreviations $fish_user_abbreviations 'l=ls'
	set -U fish_user_abbreviations $fish_user_abbreviations 'll=ls -l'
	set -U fish_user_abbreviations $fish_user_abbreviations 'lll=ls -la'
end

# Load fishmarks (http://github.com/techwizrd/fishmarks)
if [ -e $HOME/.fishmarks/marks.fish ]; and status --is-interactive
	. $HOME/.fishmarks/marks.fish
end

## fzf
#if [ -e $HOME/.fzf/shell/key-bindings.fish ]; and status --is-interactive
if [ -e $HOME/.fzf/shell/key-bindings.fish ]
	. $HOME/.fzf/shell/key-bindings.fish
end

function ssh
	switch $argv[1]
case "*.amazonaws.com"
	env TERM=xterm /usr/bin/ssh $argv
case "ec2-user@"
	env TERM=xterm /usr/bin/ssh $argv
case "*"
	/usr/bin/ssh $argv
end
end

function remote_alacritty
	# https://gist.github.com/costis/5135502
	set fn (mktemp)
	infocmp alacritty-256color > $fn
	scp $fn $argv[1]":alacritty-256color.ti"
	ssh $argv[1] tic "alacritty-256color.ti"
	ssh $argv[1] rm "alacritty-256color.ti"
end

function remarkable
	if test (count $argv) -ne 1
		echo "No file given"
		return
end

ip addr show up to 10.11.99.0/29 | grep enp0s20u2 >/dev/null
if test $status -ne 0
	# not yet connected
	echo "Connecting to reMarkable internal network"
	sudo dhcpcd enp0s20u2
end
curl --form "file=@"$argv[1] http://10.11.99.1/upload
end

function md2pdf
	set t (mktemp -t md2pdf.XXXXXXX.pdf)
	pandoc --smart --standalone --from markdown_github -V geometry:letterpaper,margin=2cm $argv[1] -o $t
	set --erase argv[1]
	if test (count $argv) -gt 0 -a $argv[1] '!=' '-'
		mv $t $argv[1]
else
	cat $t
	rm $t
end
end

function lpmd
	set infile $argv[1]
	set --erase argv[1]
	md2pdf $infile - | lp $argv -
end

function pdfo
	echo $argv | xargs pdflatex
	echo $argv | sed 's/\.tex$/.pdf/' | xargs xdg-open
end

function px
	ssh -fND localhost:8080 -C jon@ssh.thesquareplanet.com -p 222
end


## why do I have so many web servers?
# bu
function bucs
	env SSHPASS=(pass www/bucs) sshpass -e ssh bucs $argv
end
# northeastern
function athena
	env SSHPASS=(security find-generic-password -a jethrosun -s athena -w) sshpass -e ssh nu-ccis $argv
end


## what is this for again?
set nooverride PATH PWD
function onchdir -v PWD
	set dr $PWD
	while [ "$dr" != "/" ]
		for e in $dr/.setenv-*
			set envn (basename -- $e | sed 's/^\.setenv-//')
			if contains $envn $nooverride
				continue
end

if not test -s $e
	# setenv is empty
	# var value is file's dir
	set envv (readlink -e $dr)
else if test -L $e; and test -d $e
	# setenv is symlink to directory
	# var value is target directory
	set envv (readlink -e $e)
else
	# setenv is non-empty file
	# var value is file content
	set envv (cat $e)
end

if not contains $envn $wasset
	set wasset $wasset $envn
	setenv $envn $envv
end
end
set dr (dirname $dr)
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

if test (uname) = Darwin
	## PATH variables
	set PATH /usr/local/bin/ $PATH
	set PATH $PATH ~/bin
	set PATH $PATH $HOME/.cargo/bin
else
	## PATH variables
	set PATH /usr/local/bin/ $PATH
	set PATH $PATH ~/bin
	set PATH $PATH ~/.local/bin
	#set PATH $PATH ~/.local/share/umake/rust/rust-lang/rustc/bin
	set PATH $PATH ~/.cargo/bin
	set PATH $PATH /home/linuxbrew/.linuxbrew/bin
	set PATH $PATH $NPM_PACKAGES/bin
	set PATH $PATH ~/.local/share/umake/bin
	set PATH $PATH ~/dev/r/bin


end

## Other PATH variables
#setenv GOPATH "$HOME/dev/r:$HOME/dev/projects/cuckood:$HOME/dev/projects/hasmail"

## Variables setting
setenv EDITOR nvim
setenv BROWSER firefox-developer-edition
setenv EMAIL sun.shuw@northeastern.edu
setenv NAME "Jethro S. Sun"
setenv GOPATH "$HOME/dev/r"
setenv RUST_BACKTRACE 1
setenv CARGO_INCREMENTAL 1
setenv RUSTFLAGS "-C target-cpu=native"
setenv WINEDEBUG fixme-all
setenv FZF_DEFAULT_OPTS '--height 20%'

if test (uname) = Darwin
	# FZF macOS
	setenv FZF_DEFAULT_COMMAND 'ag -g ""'
	setenv FZF_CTRL_T_COMMAND 'ag -g ""'
else
	# For RLS
	# https://github.com/fish-shell/fish-shell/issues/2456
	setenv LD_LIBRARY_PATH (rustc +nightly --print sysroot)"/lib:$LD_LIBRARY_PATH"
	setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"
	setenv RLS_ROOT ~/dev/others/rls
	# FZF linux
	setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
	setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
end

# Npm
setenv NPM_PACKAGES "$HOME/.npm-packages"
#PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#unset MANPATH # delete if you already modified MANPATH elsewhere in your config
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
setenv TZ ":/etc/localtime"

## Commented stuff
# --------------------
#set -U fish_user_abbreviations $fish_user_abbreviations 'nova=env OS_PASSWORD=(pass www/mit-openstack | head -n1) nova'
#set -U fish_user_abbreviations $fish_user_abbreviations 'glance=env OS_PASSWORD=(pass www/mit-openstack | head -n1) glance'
#setenv OS_USERNAME jfrg@csail.mit.edu
#setenv OS_TENANT_NAME usersandbox_jfrg
#setenv OS_AUTH_URL https://nimbus.csail.mit.edu:5001/v2.0
#setenv OS_IMAGE_API_VERSION 1
#setenv OS_VOLUME_API_VERSION 2

function aws -d "Set up environment for AWS"
	env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1) $argv
end
function penv -d "Set up environment for the PDOS openstack service"
	env OS_PASSWORD=(pass www/mit-openstack | head -n1) OS_TENANT_NAME=pdos OS_PROJECT_NAME=pdos $argv
end
function pvm -d "Run nova/glance commands against the PDOS openstack service"
	switch $argv[1]
case 'image-*'
	penv glance $argv
case 'c'
	penv cinder $argv[2..-1]
case 'g'
	penv glance $argv[2..-1]
case '*'
	penv nova $argv
end
end

#setenv QT_DEVICE_PIXEL_RATIO 2
#setenv GDK_SCALE 2
#setenv GDK_DPI_SCALE 0.5
#setenv _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#setenv JAVA_FONTS /usr/share/fonts/TTF
#setenv MATLAB_JAVA /usr/lib/jvm/default-runtime
#setenv J2D_D3D false

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

# Base16 Shell
# ------------------------------------------------------
# I am spawning fish shell from non-interactive mode ...
#if status --is-interactive  
set BASE16_SHELL "$HOME/dev/others/base16/shell"
source "$BASE16_SHELL/profile_helper.fish"
#end


## pyenv
#set -x PATH "/home/jethros/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
set PYENV_VERSION system
status --is-interactive; and . (pyenv virtualenv-init -|psub)


# Pretty ls colors
if test -e $HOME/.dircolors
	setenv LS_COLORS (bash --noprofile -c 'eval "$(dircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
end

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
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
if test -s ~/.todo
	if [ $r -lt 10 ] # only occasionally show backlog (10%)
		echo -e " \e[1mFinished things, yay!\e[0;32m"
		set_color blue
		echo
		#echo "  [project] <description>"
		cat $HOME/.config/fish/backlog| sed 's/^/  /'
		echo
end
end

set_color normal
echo -e " \e[1mTODOs\e[0;32m"
echo
if [ $r -lt 15 ]
	# least important and urgent, remind me occasionally
	set_color cyan
	# echo "    [project] <description>"
	echo "    [PVN] NetBricks: Replicate experiments"
	echo "    [PVN] NetBricks: Modify and improve NetBricks"
	echo "    [Rust] Rust Book: check the list of unclear concepts"
	echo "    [CFP] NSDI 2020 Fall DDL: Sept 19, 2019"
	echo "    [CFP] SIGCOMM 2020 DDL: Jan 31, 2020"
end
if [ $r -lt 35 ]
	# less important and urgent
	set_color green
	# echo "    [project] <description>"
	echo "    [CFP] HotCloud 2019 DDL: Mar 6, 2019"
	echo "    [CFP] NSDI 2020 Spring DDL: Mar 19, 2019"
end
if [ $r -lt 50 ]
	# important but not urgent things, note that these are the things I work
	# on every morning
	set_color yellow
	echo "    [PVN] SGX: read primer (ring0)"
	echo "    [PVN] DPDK: Fastpass, primer "
	echo "    [Research] Short paper idea"
	echo "    [PVN] Design, Architecture and Prototype"
end

# important and urgent things, so I should get to it quick
set_color red
echo "    [NSDI 2019] Student grant application, Jan 23"
echo "    [Personal] Write-up for 7800"
echo "    [Rust] Rust by Examples: Dec 29"
echo "    [PVN] NetBricks: get familiar with the codebase"

echo
set_color normal
end


# end of [fish/config.fish]
