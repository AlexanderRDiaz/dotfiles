#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

[[ -x $(command -v "fzf") ]] && eval "$(fzf --bash)"

[[ -f $HOME/.rokit/env ]] && . "$HOME/.rokit/env"

[[ -x $(command -v "asdf") ]] && . <(asdf completion bash)

[[ -x $(command -v "pyenv") ]] && eval "$(pyenv init - bash)"

[[ -x $(command -v "starship") ]] && eval "$(starship init bash)"
