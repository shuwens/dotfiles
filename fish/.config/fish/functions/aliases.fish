#
# My fish shell abbr -a -Ues and abbrs
# -------------------------------
#
# Note that I need to revamp this sometime

if [ -e /usr/bin/trash-list ]
    # alias rm 'echo "This is not the command you are looking for."; false'
    abbr -a -U rm trash-put
end

if type -q nvim
    abbr -a -U vimdiff nvim -d
    abbr -a -U vim nvim
    abbr -a -U e nvim
    abbr -a note 'nvim ~/notes/talks.org'

    # Quick edits
    abbr -a -U Ea 'nvim ~/.config/fish/functions/aliases.fish' # nvim doesn't work well for cooking fish
    abbr -a -U Ef 'nvim ~/.config/fish/config.fish'
    abbr -a -U Eg 'nvim ~/.config/git/config'
    abbr -a -U Ev 'nvim ~/.config/nvim/init.lua'
    abbr -a -U Es 'nvim ~/.config/nvim/spell/en.utf-8.add'
    abbr -a -U Ee 'nvim ~/.spacemacs'
    abbr -a -U Et 'nvim ~/.tmux.conf'
end

if type -q exa
    abbr -a -U ls exa
    abbr -a -U la exa -a
    abbr -a -U ll exa -l --git
    abbr -a -U lll exa -la --git
else
    abbr -a -U l 'ls'
    abbr -a -U ll 'ls -l'
    abbr -a -U lll 'ls -la'
end

#
# Useful abbrs
#
abbr -a -U sduo sudo
abbr -a -U upssh "vagrant up; and vagrant ssh"
abbr -a -U v vim
abbr -a -U vi vim
abbr -a -U vim-norc 'vim -u NORC'
abbr -a -U vim-none 'vim -u NONE'

abbr -a -U w workflow.sh
abbr -a -U ws "wormhole send"
abbr -a -U wr "wormhole receive"
abbr -a -U R ranger
abbr -a bs bibtex-search
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

# Rust
abbr -a -U c "cargo"
abbr -a -U r "cargo r"
abbr -a -U cargot "cargo t"
abbr -a -U clippy "cargo clippy"
abbr -a -U cl "cargo clippy"
abbr -a -U ra "rustup add component"
abbr -a -U cr "cargo r --release"
abbr -a -U cb "cargo b --release"

# git
abbr -a -U g git
abbr -a -U gti git
abbr -a -U gm "git m"
abbr -a -U gd "git diff"
abbr -a -U gr "git rebase -i HEAD~5"
abbr -a -U gs "git status"
abbr -a -U gc "git clone"
abbr -a -U a 'git amend --allow-empty --no-verify'
abbr -a -U gb 'git recent-branches 2.days.ago'
abbr -a -U gl 'git lg1'
abbr -a -U gg 'git lg2'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a -U push 'git push'
abbr -a -U pull 'git pull'

abbr -a -U df 'command df -m'
#abbr -a -U su 'command su -m'
#abbr -a -U ls 'command ls -FG'

## My own stuff!
abbr -a -U cls "clear"
abbr -a -U , "make"
abbr -a -U ,, "make all"
abbr -a -U ,,, "make clean; and make"
abbr -a -U vi "nvim"
abbr -a -U :q "sudo reboot"
abbr -a -U yr "yabai -m window --toggle float; yabai -m window --grid 12:12:1:0:10:11"
abbr -a -U vpn "eval /etc/profile.d/PanMSInit.sh; sleep 5; globalprotect connect -portal vpn.northeastern.edu"
abbr -a -U dvpn "globalprotect disconnect"

abbr -a py "pyenv activate py3"
abbr -a py2 "pyenv activate neovim2"
abbr -a pyn "pyenv activate neovim3"

# wget -A pdf,mp3,ps,djvu,tex,doc,docx,xls,xlsx,gz,ppt,mp4,avi,zip,rar,html,htm,asp,php --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla https://pg.ucsd.edu
abbr -a -U WgetScrape "wget -A pdf -m -p -E -k -K -np"
abbr -a -U PhpWgetScrape "wget -A php -m -p -E -k -K -np"
abbr -a -U TexWgetScrape "wget -A tex -m -p -E -k -K -np"

# my ssh utils
function UpdateFile -a filename
    scp $filename nu:~/public_html/www/
end

if test -d ~/dev/pvn/netbricks
    abbr -a -U n "cd ~/dev/pvn/netbricks"
    abbr -a -U u "cd ~/dev/pvn/utils"
else if test -d ~/dev/netbricks
    abbr -a -U n "cd ~/dev/netbricks"
else
end

function take
    set -l dir $argv[1]
    mkdir -p $dir; and cd $dir
end


if test (uname) = Darwin
else
    function pdf -a filename
        mupdf -r 165 $filename &
    end

    function o #-a filename
        set o_flags
        for arg in $argv
            if string match -rq -- '^-' $arg
                set o_flags $o_flags $arg
            end
            if string match -rq -- '.pdf$' $arg
                set o_pdf_args $o_pdf_args $arg
            else
                set o_open_args $o_open_args $arg
            end
        end
        if set -q o_pdf_args
			mupdf $o_flags -r 178 $o_pdf_args &
        end
        if set -q o_open_args
            xdg-open $o_flags $o_open_args &
        end
    end

    function open
        set o_flags
        for arg in $argv
            if string match -rq -- '^-' $arg
                set o_flags $o_flags $arg
            end
            if string match -rq -- '.pdf$' $arg
                set o_pdf_args $o_pdf_args $arg
            else
                set o_open_args $o_open_args $arg
            end
        end
        if set -q o_pdf_args
            mupdf $o_flags -r 160 $o_pdf_args &
        end
        if set -q o_open_args
            xdg-open $o_flags $o_open_args &
        end
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

function check
    if test "$argv"
        git add -A
        git commit -am "Checkpoint: $argv"
        git push
    else
        git cp
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

function px
    ssh -fND localhost:8080 -C jon@ssh.thesquareplanet.com -p 222
end

function cat --description "mdcat for markdown files, cat for everything else"
    set cat_flags
    for arg in $argv
        if string match -rq -- '^-' $arg
            set cat_flags $cat_flags $arg
        end
        if string match -rq -- '.md$' $arg
            set cat_mdcat_args $cat_mdcat_args $arg
        else if string match -rq -- '.json$' $arg
            set cat_jsoncat_args $cat_jsoncat_args $arg
        else
            set cat_cat_args $cat_cat_args $arg
        end
    end
    if set -q cat_mdcat_args
        command mdcat $cat_flags $cat_mdcat_args
    end
    if set -q cat_jsoncat_args
        command cat $cat_flags $cat_jsoncat_args | jq .
    end
    if set -q cat_cat_args
        command cat $cat_flags $cat_cat_args
    end

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
