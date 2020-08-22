#
# My fish shell abbr -a -Ues and abbrs
# -------------------------------
#
# Note that I need to revamp this sometime

#
# Useful abbrs
#
abbr -a -U vimdiff nvim -d
abbr -a -U sduo sudo
abbr -a -U upssh "vagrant up; and vagrant ssh"
abbr -a -U b brew
abbr -a -U vim nvim
abbr -a -U v vagrant
abbr -a -U e nvim
abbr -a -U ws "wormhole send"
abbr -a -U wr "wormhole receive"
abbr -a -U vi vim
# abbr -a -U jn jupyter notebook
abbr -a -U R ranger
abbr -a -U lab "GIT_SSH_COMMAND=\"ssh -i ~/.ssh/jethrosun_rsa\" git $argv"
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1)'
abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[] | {iid: .InstanceId, type: .InstanceType, key:.KeyName, state:.State.Name, host:.PublicDnsName}'"

abbr -a pvn nvim ~/writings/northeastern/projects/pvn/pvn.org
abbr -a idea nvim ~/git/home/academic/outline.org
abbr -a bs bibtex-search

abbr -a note 'nvim ~/notes/talks.org'

# Rust
abbr -a -U c cargo
abbr -a -U cargot cargo t
abbr -a -U clippy cargo clippy
abbr -a -U cl cargo clippy
#abbr -a -U r rustup
abbr -a -U ra rustup add component

# git
abbr -a -U g git
abbr -a -U gm git m
abbr -a -U m 'git commit; and git push'
abbr -a -U gc git clone
abbr -a -U ggo git checkout
abbr -a -U gb git branch
abbr -a -U gd git diff
abbr -a -U gr git rebase -i HEAD~5
abbr -a -U gti git
abbr -a -U a 'git amend --allow-empty --no-verify'
abbr -a -U gb 'git recent-branches 2.days.ago'
abbr -a -U gl 'git lg1'
abbr -a -U gg 'git lg2'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a -U push 'git push'
abbr -a -U pull 'git pull'

# Quick edits
abbr -a -U Ea 'nvim ~/.config/fish/functions/aliases.fish'  # nvim doesn't work well for cooking fish
abbr -a -U Ef 'nvim ~/.config/fish/config.fish'
#abbr -a -U Ep 'nvim ~/.config/powerline-shell/config.json'
abbr -a -U Eg 'nvim ~/.gitconfig'
abbr -a -U Ev 'nvim ~/.config/nvim/init.vim'
abbr -a -U Es 'nvim ~/.config/nvim/spell/en.utf-8.add'
abbr -a -U Ee 'nvim ~/.spacemacs'
abbr -a -U Et 'nvim ~/.tmux.conf'
abbr -a -U Ex 'nvim ~/.xmonad/xmonad.hs'

abbr -a -U df 'command df -m'
#abbr -a -U su 'command su -m'
#abbr -a -U ls 'command ls -FG'

abbr -a -U holdmybeer 'sudo'

## my ssh utils
function UpdateFile -a filename
	scp $filename nu-ccis:~/.www/tmp/
end

abbr -a -U ggco 'git switch'
abbr -a -U fl 'clear; and flow-limit'

# =======================================================
#
#               DEPRECATED
#
# =======================================================


#abbr -a -U UpdateResume "scp ~/writing/phd-application/nice_cv/sun_cv.pdf shwsun@csa2.bu.edu:~/public_html/tmp"
#abbr -a -U UpdateStatement "scp ~/writing/phd-application/sop/statement.pdf shwsun@csa2.bu.edu:~/public_html/tmp"

#abbr -a -U jn "jupyter notebook --browser=google-chromium-browser"
abbr -a -U jn "jupyter notebook --browser=firefox"

abbr -a -U vim-norc 'vim -u NORC'
abbr -a -U vim-none 'vim -u NONE'

function pdftext
	pdftotext -layout $argv[1] -
end

function serve
	if test (count $argv) -ge 1
		if python -c 'import sys; sys.exit(sys.version_info[0] != 3)'
			/bin/sh -c "(cd $argv[1] && python -m http.server)"
else
	/bin/sh -c "(cd $argv[1] && python -m SimpleHTTPServer)"
end
else
	python -m SimpleHTTPServer
end
end

function timestamp
	python -c 'import time; print(int(time.time()))'
end

#set LS_COLORS dxfxcxdxbxegedabagacad
function lsd -d 'List only directories (in the current dir)'
	command ls -d */ | sed -Ee 's,/+$,,'
end

# Colorized cat (will guess file type based on contents)
abbr -a -U ccat 'pygmentize -g'

abbr -a -U c "cargo"
abbr -a -U r "cargo r"
abbr -a -U v vim
abbr -a -U vim nvim
abbr -a -U x 'tig HEAD'
abbr -a -U xx 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --branches'
abbr -a -U xxa 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --all'
abbr -a -U xxaa 'tig --all'
abbr -a -U notes 'ag "TODO|HACK|FIXME|OPTIMIZE"'

abbr -a -U m make
abbr -a -U mm 'make run'

abbr -a -U reset-mailbox 'rm -v ~/Library/Caches/com.dropbox.mbd.external-beta/mailbox.db'

abbr -a -U wifi 'nmcli d wifi list'



function da -d "Allow or disallow .envrc after printing it."
	echo "------------------------------------------------"
	cat .envrc
	echo "------------------------------------------------"
	echo "To allow, hit Return."
	read answer
	direnv allow
end

function def -d "Quickly jump to place where a function, method, or variable is defined"
	va "^\s*(def\s+$argv|$argv\s*[=])"
end

function vimff
	vim (ffind -tf $argv)
end

function f
	git ls-tree -r --name-only HEAD
end

function vf
	f | fzf | xargs -o vim
end

function va
	set pattern $argv[1]
	if test (count $argv) -gt 1
		set argv $argv[2..-1]
else
	set argv
end

set ag_pattern (echo $pattern | sed -Ee 's/[<>]/\\\\b/g')
set vim_pattern (echo $pattern | sed -E -e 's,([/=]),\\\\\1,g' -e 's,.*,/\\\\v&,')
ag -l --smart-case --null $ag_pattern -- $argv ^/dev/null | xargs -0 -o vim -c $vim_pattern
end

function vaa
	set pattern $argv[1]
	if test (count $argv) -gt 1
		set argv $argv[2..-1]
else
	set argv
end

set ag_pattern (echo $argv | sed -Ee 's/[<>]/\\\\b/g')
set vim_pattern (echo $argv | sed -E -e 's,([/=]),\\\\\1,g' -e 's,.*,/\\\\v&,')
ag -l --smart-case --null -a $ag_pattern -- $argv ^/dev/null | xargs -0 -o vim -c $vim_pattern
end

## Git abbr -a -Ues

function vc
	if git modified -q $argv
		vim (git modified $argv | sed -Ee 's/^"(.*)"$/\1/')
else
	echo '(nothing changed)'
end
end

function vca
	if git modified -qi
		vim (git modified -i | sed -Ee 's/^"(.*)"$/\1/')
else
	echo '(nothing changed)'
end
end

function vci
	if git modified -qi
		vim (begin; git modified -i; git modified; end | sort | uniq -u | sed -Ee 's/^"(.*)"$/\1/')
else
	echo '(nothing changed)'
end
end

abbr -a -U vch 'vc head'
abbr -a -U vch1 'vc head~1'
abbr -a -U vch2 'vc head~2'

function vu
	if git modified -u $argv
		vim (git modified -u $argv | sed -Ee 's/^"(.*)"$/\1/')
else
	echo 'no files with conflicts'
end
end

function vw
	vim (which "$argv")
end

function vconflicts
	# Opens all files with merge conflict markers
	va '^([<]{7}|[>]{7}|[=]{7})([ ].*)?$'
end

function git-search
	git log -S"$argv" --pretty=format:%H | map git show
end


function cleanpycs
	find . -name '.git' -prune -o -name '__pycache__' -delete
	find . -name '.git' -prune -o -name '*.py[co]' -delete
end

function cleanorigs
	find . '(' -name '*.orig' -o -name '*.BACKUP.*' -o -name '*.BASE.*' -o -name '*.LOCAL.*' -o -name '*.REMOTE.*' ')' -print0 | xargs -0 rm -f
end

function cleandsstores
	find . -name '.DS_Store' -exec rm -f '{}' ';'
end

abbr -a -U json 'prettify-json'
abbr -a -U map 'xargs -n1'
abbr -a -U collapse "sed -e 's/  */ /g'"
abbr -a -U cuts 'cut -d\ '

function p -d "Start the best Python shell that is available"
	set -l cmd

	if test -f manage.py
		if pip freeze ^/dev/null | grep -iq 'django-extensions'
			set cmd (which python) manage.py shell_plus
else
	if pip freeze ^/dev/null | grep -iq 'flask-script'
		# do nothing, use manage.py, fall through
		set -e cmd
	else
		set cmd (which python) manage.py shell
	end
end
end

if test -z $cmd
	set -l interpreters (which bpython ^/dev/null; which ipython ^/dev/null; which python ^/dev/null)

	if test -z "$interpreters"
		set_color red
		echo "No python interpreters found on the PATH."
		set_color normal
		return 127
end

# Try to find the first interpreter within the current virtualenv
# Rationale: it's more important to start a Python interpreter in the
# current virtualenv than it is to start an _IPython_ interpreter (for
# example, when the current virtualenv has no ipython installed, but such
# would be installed system-wide).
for interp in $interpreters
	#echo '-' $interp
	#echo '-' (dirname (dirname $interp))
	if test (dirname (dirname $interp)) = "$VIRTUAL_ENV"
		set cmd $interp
		break
	end
end

# If they all fall outside the virtualenv, pick the first match
# (preferring ipython over python)
if test -z "$cmd"
	set cmd $interpreters[1]
end
end

# Run the command
printf "Using "; set_color green; echo $cmd; set_color normal
eval $cmd $argv
end

abbr -a -U pm 'python manage.py'
abbr -a -U pmm 'python manage.py migrate'
abbr -a -U pmmm 'python manage.py makemigrations'
abbr -a -U pms 'python manage.py shell_plus'
abbr -a -U pmr 'python manage.py runserver_plus 0.0.0.0:8000'

function pipr -d "Find & install all requirements for this project"
	pushd (git root)
	begin
		if test -f requirements.txt
			command pip install -r requirements.txt
end
if test -f dev-requirements.txt
	command pip install -r dev-requirements.txt
end
if test -f .pipignore
	command pip install -r .pipignore
end
end
popd
end

# Directories {{{

function cdff --description "cd's into the current front-most open Finder window's directory"
	cd (ff $argv)
end

function ff
	echo '
	tell application "Finder"
	if (1 <= (count Finder windows)) then
		get POSIX path of (target of window 1 as abbr -a -U)
else
	get POSIX path of (desktop as abbr -a -U)
end if
end tell
' | osascript -
end

abbr -a -U cd.. 'cd ..'
abbr -a -U .. 'cd ..'
abbr -a -U ... 'cd ../..'
abbr -a -U .... 'cd ../../..'
abbr -a -U ..... 'cd ../../../..'

abbr -a -U md 'mkdir -p'
function take
	set -l dir $argv[1]
	mkdir -p $dir; and cd $dir
end
abbr -a -U cx 'chmod +x'
abbr -a -U 'c-x' 'chmod -x'

# }}}

function colorize-pboard
	if test (count $argv) -gt 0
		set lang $argv[1]
else
	set lang 'python'
end
pbpaste | strip-indents | color-syntax | pbcopy
end

function color-syntax
	if test (count $argv) -gt 0
		set lang $argv[1]
else
	set lang 'python'
end
pygmentize -f rtf -l $lang
end

abbr -a -U h heroku
abbr -a -U gp 'cd ~/Projects/SimpleContacts/simplecontacts'

function wtf -d "Print which and --version output for the given command"
	for arg in $argv
		echo $arg: (which $arg)
		echo $arg: (sh -c "$arg --version")
end
end

## My own stuff!
abbr -a -U gs "git status"
abbr -a -U gc "git clone"
abbr -a -U cls "clear"
abbr -a -U , "make"
abbr -a -U ,, "make clean"
#abbr -a -U ,,, '"make clean"; and "make"'
abbr -a -U vi "nvim"
abbr -a -U :q "sudo reboot"

function bar
	eval "sudo -E -u jethros $HOME/.config/polybar/launch.sh &"
end

# wget -A pdf,mp3,ps,djvu,tex,doc,docx,xls,xlsx,gz,ppt,mp4,avi,zip,rar,html,htm,asp,php --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla https://pg.ucsd.edu
abbr -a -U WgetScrape "wget -A pdf -m -p -E -k -K -np"
abbr -a -U PhpWgetScrape "wget -A php -m -p -E -k -K -np"
abbr -a -U TexWgetScrape "wget -A tex -m -p -E -k -K -np"

# Type - to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
end
cd ..
end
end

## tips function
# tips tar
# https://wiki.archlinux.org/index.php/Core_utilities#tar
# https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/


## python stuff
#install virtualfish
#abbr -a -U virtualenv3 "virtualenv -p /usr/bin/python3"
#abbr -a -U workon "vf activate"
#abbr -a -U walkaway "vf deactivate"

#abbr -a -U up '"sudo apt update"; and "sudo apt --list-upgrades"'
#abbr -a -U upgrade 'sudo apt upgrade'

function ,,,
	make clean; and make
end

if test (uname) = Darwin
else
	function o -a filename
		xdg-open $filename &
end

function open -a filename
	xdg-open $filename &
end
end

# for git journal, I should only use ["Added", "Changed", "Fixed", "Improved", "Removed"]
function lazy
	if test "$argv"
		git add -A
		git commit -m "$argv"
		git push
	else
		git add -A
		git commit -am \"(echo (curl -s http://whatthecommit.com/index.txt)\"
		git pull --rebase
		git push
	end
end

# Add this to your ~/.config/fish/config.fish
# Syntax:
# To just rerun your last command, simply type '!!'
# '!! sudo' will prepend sudo to your most recent command
# Running !! with anything other than sudo will append the argument to your most recent command
# To add another command to prepend list remove the # on line 10 and put the command in the quotes. Repeat as needed
function !!;
	set prevcmd (history | head -n 1)
	if test "$argv"
		if test "$argv" = "sudo"        #; or "any other command you want to prepend"
			eval "$argv $prevcmd"
else
	eval "$var $argv"
end
else
	eval "$var"
end
end

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

# zathura
function z
	if test (count $argv) -ne 1
		echo "No file given"
		return
else
	zathura $argv &
end
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


function em --description "Emacs from the terminal."
  emacsclient -t $argv
end

function mktable --description "produces a LaTeX table for oxide testing results"
    set -q argv[1]; or set argv[1] (pwd)

    echo "\begin{tabular}{*{21}{c|}c}"
    echo "\multicolumn{2}{c|}{in-scope} & \multicolumn{20}{c}{disqualified} \\\\ \hline"
    echo "borrowck & nll & advanced control flow & casting &
    first-class constructors & debug dump & enums & function mutability & heap &
    inline asm & out-of-scope library & macros & multithreading &
    slice patterns & statics \& constants & traits &
    two-phase borrows & uninitialized variables & universal function call &
    unsafe & variable mutability \\\\ \hline"

    echo -n (cat "$argv/tests/borrowck/results.json" | jq ".matches | length") " & "
    echo -n (math (cat "$argv/tests/nll/results.json" | jq ".matches | length") + \
                  (cat "$argv/tests/nll/closure-requirements/results.json" | jq ".matches | length") + \
                  (cat "$argv/tests/nll/relate_tys/results.json" | jq ".matches | length") + \
                  (cat "$argv/tests/nll/user-annotations/results.json" | jq ".matches | length"))

    for folder in (ls $argv/tests/disqualified)
        echo -n " &" (ls -1 $argv/tests/disqualified/$folder | wc -l | xargs)
    end
    echo " \\\\"

    echo "\end{tabular}"
end


function cat --description "mdcat for markdown files, cat for everything else"
  set cat_flags
  for arg in $argv
    if string match -rq -- '^-' $arg
      set cat_flags $cat_flags $arg
    end
    if string match -rq -- '.md$' $arg
      set cat_mdcat_args $cat_mdcat_args $arg
    else
      set cat_cat_args $cat_cat_args $arg
    end
  end
  if set -q cat_mdcat_args
    command mdcat $cat_flags $cat_mdcat_args
  end
  if set -q cat_cat_args
    command cat $cat_flags $cat_cat_args
  end
end

# ----------------------------------
# Compiling stuff
# ----------------------------------
abbr -a -U ghcd "ghc -dynamic"
abbr -a -U g11 'g++ -std=c++11 -O2'
abbr -a -U g+ "g++ -std=gnu++11 -Wall -Wextra -g"

# Convenience abbr -a -Ues
abbr -a -U run 'sudo systemctl start'
abbr -a -U restart 'sudo systemctl restart'
abbr -a -U stop 'sudo systemctl stop'
# ---------------------------------
abbr -a -U emacs 'emacs -nw'

## DEPRECATED
#abbr -a -U UpdateResume "scp ~/writing/phd-application/nice_cv/sun_cv.pdf shwsun@csa2.bu.edu:~/public_html/tmp"
#abbr -a -U UpdateStatement "scp ~/writing/phd-application/sop/statement.pdf shwsun@csa2.bu.edu:~/public_html/tmp"

#abbr -a -U jn "jupyter notebook --browser=google-chromium-browser"
