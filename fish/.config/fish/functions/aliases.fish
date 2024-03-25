#
# My fish shell abbr -a es and abbrs
# -------------------------------
#
# Note that I need to revamp this sometime

if [ -e /usr/bin/trash-list ]
    # alias rm 'echo "This is not the command you are looking for."; false'
    abbr -a  rm trash-put
end

if type -q nvim
    abbr -a  vimdiff nvim -d
    abbr -a  vim nvim
    abbr -a  e nvim
    abbr -a note 'nvim ~/notes/talks.org'

    # Quick edits
    abbr -a  Ea 'nvim ~/.config/fish/functions/aliases.fish' # nvim doesn't work well for cooking fish
    abbr -a  Ef 'nvim ~/.config/fish/config.fish'
    abbr -a  Eg 'nvim ~/.config/git/config'
    abbr -a  Ev 'nvim ~/.config/nvim/init.lua'
    abbr -a  Es 'nvim ~/.config/nvim/spell/en.utf-8.add'
    abbr -a  Ee 'nvim ~/.spacemacs'
    abbr -a  Et 'nvim ~/.tmux.conf'
    abbr -a  Ed 'nvim ~/.config/doom/init.el'
end

if type -q eza
    abbr -a  ls eza
    abbr -a  la eza -a
    abbr -a  ll eza -l --git
    abbr -a  lll eza -la --git
else
    abbr -a  l 'ls'
    abbr -a  ll 'ls -l'
    abbr -a  lll 'ls -la'
end

#
# Useful abbrs
#
abbr -a  sduo sudo
abbr -a  upssh "vagrant up; and vagrant ssh"
abbr -a  v vim
abbr -a  vi vim
abbr -a  vim-norc 'vim -u NORC'
abbr -a  vim-none 'vim -u NONE'

abbr -a  w workflow.sh
abbr -a  ws "wormhole send"
abbr -a  wr "wormhole receive"
abbr -a  R ranger
abbr -a bs bibtex-search
abbr -a  notes 'ag "TODO|HACK|FIXME|OPTIMIZE"'
abbr -a  m make
abbr -a  mm 'make run'
abbr -a  wifi 'nmcli d wifi list'

abbr -a  json 'prettify-json'
abbr -a  map 'xargs -n1'
abbr -a  collapse "sed -e 's/  */ /g'"
abbr -a  cuts 'cut -d\ '

abbr -a  cd.. 'cd ..'
abbr -a  .. 'cd ..'
abbr -a  ... 'cd ../..'
abbr -a  .... 'cd ../../..'
abbr -a  ..... 'cd ../../../..'

# Rust
abbr -a  c "cargo"
abbr -a  r "cargo r"
abbr -a  cargot "cargo t"
abbr -a  clippy "cargo clippy"
abbr -a  cl "cargo clippy"
abbr -a  ra "rustup add component"
abbr -a  cr "cargo r --release"
abbr -a  cb "cargo b --release"

# git
abbr -a  g git
abbr -a  gti git
abbr -a  gm "git m"
abbr -a  gd "git diff"
abbr -a  gr "git rebase -i HEAD~5"
abbr -a  gs "git status"
abbr -a  gck "git checkout"
abbr -a  gc "git clone"
abbr -a  a 'git amend --allow-empty --no-verify'
abbr -a  gb 'git recent-branches 2.days.ago'
abbr -a  gl 'git lg1'
abbr -a  gg 'git lg2'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a  push 'git push'
abbr -a  pull 'git pull'

abbr -a  df 'command df -m'
#abbr -a  su 'command su -m'
#abbr -a  ls 'command ls -FG'

## My own stuff!
abbr -a  cls "clear"
abbr -a  , "make"
abbr -a  ,, "make all"
abbr -a  ,,, "make clean; and make"
abbr -a  vi "nvim"
abbr -a  :q "sudo reboot"
abbr -a  yr "yabai -m window --toggle float; yabai -m window --grid 12:12:1:0:10:11"
abbr -a  vpn "eval /etc/profile.d/PanMSInit.sh; sleep 5; globalprotect connect -portal vpn.northeastern.edu"
abbr -a  dvpn "globalprotect disconnect"

abbr -a py "pyenv activate py3"
abbr -a py2 "pyenv activate neovim2"
abbr -a pyn "pyenv activate neovim3"

# wget -A pdf,mp3,ps,djvu,tex,doc,docx,xls,xlsx,gz,ppt,mp4,avi,zip,rar,html,htm,asp,php --no-clobber --convert-links --random-wait -r -p -E -e robots=off  mozilla https://pg.ucsd.edu
abbr -a  WgetScrape "wget -A pdf -m -p -E -k -K -np"
abbr -a  PhpWgetScrape "wget -A php -m -p -E -k -K -np"
abbr -a  TexWgetScrape "wget -A tex -m -p -E -k -K -np"

# my ssh utils
function UpdateFile -a filename
    scp $filename nu:~/public_html/www/
end

if test -d ~/dev/pvn/netbricks
    abbr -a  n "cd ~/dev/pvn/netbricks"
    abbr -a  u "cd ~/dev/pvn/utils"
else if test -d ~/dev/netbricks
    abbr -a  n "cd ~/dev/netbricks"
else
end

function take
    set -l dir $argv[1]
    mkdir -p $dir; and cd $dir
end


if test (uname) = Darwin
else
    function pdf -a filename
        zathura $filename &
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
	zathura $o_flags $o_pdf_args &
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


if type -q exa
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
