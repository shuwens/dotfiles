# Quick edits
alias Ea 'nvim ~/.config/fish/aliases.fish'
alias Ef 'nvim ~/.config/fish/config.fish'
alias Eg 'nvim ~/.gitconfig'
alias Ev 'nvim ~/.config/nvim/init.vim'
alias Es 'nvim ~/.spacemacs'
alias Ex 'nvim ~/.xmonad/xmonad.hs'
#alias Et 'vim ~/.tmux.conf'

alias vim-norc 'vim -u NORC'
alias vim-none 'vim -u NONE'

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

alias df 'command df -m'
#alias j jobs
alias l ls
alias ll 'ls -la'
alias ls 'command ls -FG'
alias su 'command su -m'

function lsd -d 'List only directories (in the current dir)'
  command ls -d */ | sed -Ee 's,/+$,,'
end

# Colorized cat (will guess file type based on contents)
alias ccat 'pygmentize -g'

alias c clear
alias v vim
alias x 'tig HEAD'
alias xx 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --branches'
alias xxa 'tig --exclude=production --exclude="*/production" --exclude=canary --exclude="*/canary" --all'
alias xxaa 'tig --all'
alias notes 'ag "TODO|HACK|FIXME|OPTIMIZE"'

alias m make
alias mm 'make run'

alias reset-mailbox 'rm -v ~/Library/Caches/com.dropbox.mbd.external-beta/mailbox.db'

alias wifi 'nmcli d wifi list'

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

## Git aliases

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

alias vch 'vc head'
alias vch1 'vc head~1'
alias vch2 'vc head~2'

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

alias git hub
alias gti git
alias a 'git amend --allow-empty --no-verify'
alias gb 'git recent-branches 2.days.ago'
alias ggco 'git switch'
alias fl 'clear; and flow-limit'
alias gl 'git lg1'
alias gg 'git lg2'
alias push 'git push'
alias pull 'git pull'

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

alias json 'prettify-json'
alias map 'xargs -n1'
alias collapse "sed -e 's/  */ /g'"
alias cuts 'cut -d\ '

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

alias pm 'python manage.py'
alias pmm 'python manage.py migrate'
alias pmmm 'python manage.py makemigrations'
alias pms 'python manage.py shell_plus'
alias pmr 'python manage.py runserver_plus 0.0.0.0:8000'

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
    get POSIX path of (target of window 1 as alias)
else
  get POSIX path of (desktop as alias)
end if
end tell
' | osascript -
end

alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

alias md 'mkdir -p'
function take
  set -l dir $argv[1]
  mkdir -p $dir; and cd $dir
end
alias cx 'chmod +x'
alias 'c-x' 'chmod -x'

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

alias h=heroku
alias gp='cd ~/Projects/SimpleContacts/simplecontacts'

function wtf -d "Print which and --version output for the given command"
  for arg in $argv
    echo $arg: (which $arg)
    echo $arg: (sh -c "$arg --version")
end
end

## My own stuff!
alias gs "git status"
alias gc "git clone"
alias cls "clear"
alias ls "exa"
alias , "make"
alias ,, "make clean"
#alias ,,, '"make clean"; and "make"'
alias vi "nvim"
alias :q "sudo reboot"

function bar
  eval "sudo -E -u jethros $HOME/.config/polybar/launch.sh &"
end

alias WgetScrape "wget -A pdf -m -p -E -k -K -np"
alias PhpWgetScrape "wget -A php -m -p -E -k -K -np"
alias TexWgetScrape "wget -A tex -m -p -E -k -K -np"

## tips function
# tips tar
# https://wiki.archlinux.org/index.php/Core_utilities#tar
# https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/


## python stuff 
#install virtualfish
#alias virtualenv3 "virtualenv -p /usr/bin/python3"
#alias workon "vf activate"
#alias walkaway "vf deactivate"

#alias up '"sudo apt update"; and "sudo apt --list-upgrades"'
#alias upgrade 'sudo apt upgrade'

function ,,,
  make clean; and make
end
function o -a filename
  xdg-open $filename &
end

function open -a filename
  xdg-open $filename &
end

function lazy
  if test "$argv"
    git add -A
    git commit -m "Update: $argv"
    git push
else
  git add -A
  git commit -m "Just some simple update"
  git push
end
end

function check
  if test "$argv"
    git add -A
    git commit -m "Checkpoint: $argv"
    git push
else
  git add -A
  git commit -m "Checkpoint: random"
  git push
end
end

# ----------------------------------
# Compiling stuff
# ----------------------------------
alias ghcd "ghc -dynamic"
alias g11 'g++ -std=c++11 -O2'
alias g+ "g++ -std=gnu++11 -Wall -Wextra -g"

# Convenience aliases
alias run 'sudo systemctl start'
alias restart 'sudo systemctl restart'
alias stop 'sudo systemctl stop'
# ---------------------------------
alias holdmybeer 'sudo'

## my ssh utils
function UpdateFile -a filename
  env SSHPASS=(pass www/ccis) sshpass -e scp $filename nu-ccis:~/.www/tmp/
end

alias emacs 'emacs '
alias neo-update 'env SHELL=(which sh) nvim +PlugInstall +PlugClean +PlugUpdate UpdateRemotePlugins'

## DEPRECATED
#alias UpdateResume "scp ~/writing/phd-application/nice_cv/sun_cv.pdf shwsun@csa2.bu.edu:~/public_html/tmp"
#alias UpdateStatement "scp ~/writing/phd-application/sop/statement.pdf shwsun@csa2.bu.edu:~/public_html/tmp"

#alias jn "jupyter notebook --browser=google-chromium-browser"
alias jn "jupyter notebook --browser=chromium-browser"
