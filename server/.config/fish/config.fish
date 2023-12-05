if status is-interactive
    # Commands to run in interactive sessions can go here
end

# common
abbr -a vim nvim
abbr -a c cargo
abbr -a gs 'git status'
abbr -a pull 'git pull'
abbr -a push 'git push'

abbr -a g '~/dev/garage/target/release/garage'
abbr -a Ev 'nvim ~/.config/nvim/init.lua'
abbr -a Ef 'nvim ~/.config/fish/config.fish'

abbr -a e etcdctl

set PATH $PATH $HOME/.cargo/bin
# Add pyenv, if available
if test -d "$HOME/.pyenv"
    pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
end

setenv EDITOR nvim
setenv VISUAL nvim
