#                 ██
#                ░██
#  ██████  ██████░██      ██████  █████
# ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#    ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#   ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██████ ██████ ░██  ░██░███   ░░█████
# ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░
#
# The zshrc is now bogus -- I only use it to fish


#█▓▒░ load configs

#source ~/.zshenv

export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --follow --glob "!.git/*"'

$HOME/bin/br.sh
exec fish

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
