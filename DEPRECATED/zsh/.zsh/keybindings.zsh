#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ xero <x@xero.nu>
# ░▓ code   ▓ http://code.xero.nu/dotfiles
# ░▓ mirror ▓ http://git.io/.files
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ keybindings
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

key[CtrlLeft]=${terminfo[kLFT5]}
key[CtrlRight]=${terminfo[kRFT5]}


[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    printf '%s' "${terminfo[smkx]}"
  }
  function zle-line-finish () {
    printf '%s' "${terminfo[rmkx]}"
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# [[ -n "${key[CtrlLeft]}" ]]  && bindkey  "${key[CtrlLeft]}" backward-word
# [[ -n "${key[CtrlRight]}" ]]  && bindkey  "${key[CtrlRight]}" forward-word

# ctrl-left, ctrl-right - move cursor over words
# xterm-256-color?
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word
# urxvt
bindkey "\eOd" emacs-backward-word
bindkey "\eOc" emacs-forward-word # lands between words, not on first char

# alt-left, alt-right - move cursor to start of previous or next word
# same as ctrl-left/right, just fixes accidental pressing. to change to cursor location on end of jump..
# xterm
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# urxvt
bindkey '^[^[[D'  backward-word
bindkey '^[^[[C'  forward-word

# ctrl-backspace - deletes word to left of cursor
bindkey "" backward-kill-word

# ctrl-del - deletes word to right of cursor
# xterm
bindkey '^[[3;5~' kill-word
# urxvt
bindkey '^[[3^'   kill-word

# my setting
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


bindkey -e                      # Default to Emacs-like bindings

zle -N parent-dir
parent-dir() {
local cursor=$CURSOR        # Save cursor position
local buffer=$BUFFER        # Save buffer contents
BUFFER=                     # Clear edit buffer
zle -R                      # Redraw the now empty input line
local i cmd=..              # Consume numeric argument
for (( i = 1 ; i < NUMERIC ; i++ )); do
  cmd=$cmd/..
done
print "cd $cmd"             # So it's clear what's happening from scrollback
cd $cmd
# XXX reset-prompt doesn't work on zsh 4.0.x
zle reset-prompt -N         # Redraw the prompt itself
BUFFER=$buffer              # Restore the buffer contents
CURSOR=$cursor              # And move the cursor back to where it was
}
bindkey '\C-u' parent-dir

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
local selected restore_no_bang_hist
if selected=$(fc -l 1 | $(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r -q "$LBUFFER"); then
  num=$(echo "$selected" | head -1 | awk '{print $1}' | sed 's/[^0-9]//g')
  LBUFFER=!$num
  if setopt | grep nobanghist > /dev/null; then
    restore_no_bang_hist=1
    unsetopt no_bang_hist
  fi
  zle expand-history
  [ -n "$restore_no_bang_hist" ] && setopt no_bang_hist
fi
zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# end of 
