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

abbr -a bs bibtex-search

abbr -a py3 "pyenv activate neovim3"
abbr -a pyn "pyenv activate newest"

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
abbr -a -U Ea 'nvim ~/.config/fish/functions/aliases.fish' # nvim doesn't work well for cooking fish
abbr -a -U Ef 'nvim ~/.config/fish/config.fish'
#abbr -a -U Ep 'nvim ~/.config/powerline-shell/config.json'
abbr -a -U Eg 'nvim ~/.config/git/config'
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

#abbr -a -U jn "jupyter notebook --browser=google-chromium-browser"
abbr -a -U jn "jupyter notebook --browser=firefox"

abbr -a -U vim-norc 'vim -u NORC'
abbr -a -U vim-none 'vim -u NONE'

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
abbr -a -U notes 'ag "TODO|HACK|FIXME|OPTIMIZE"'
abbr -a -U m make
abbr -a -U mm 'make run'
abbr -a -U wifi 'nmcli d wifi list'

abbr -a -U json 'prettify-json'
abbr -a -U map 'xargs -n1'
abbr -a -U collapse "sed -e 's/  */ /g'"
abbr -a -U cuts 'cut -d\ '

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
        git commit -am "$argv"
        git push
    else
        git r
    end
end

# Add this to your ~/.config/fish/config.fish
# Syntax:
# To just rerun your last command, simply type '!!'
# '!! sudo' will prepend sudo to your most recent command
# Running !! with anything other than sudo will append the argument to your most recent command
# To add another command to prepend list remove the # on line 10 and put the command in the quotes. Repeat as needed
function !!
    set prevcmd (history | head -n 1)
    if test "$argv"
        if test "$argv" = "sudo" #; or "any other command you want to prepend"
            eval "$argv $prevcmd"
        else
            eval "$var $argv"
        end
    else
        eval "$var"
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
    infocmp alacritty-256color >$fn
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
