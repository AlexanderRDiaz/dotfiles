#
# ~/.zshrc
#

[[ -d /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -x $(command -v "fzf") ]] && eval "$(fzf --zsh)"

[[ -f $HOME/.rokit/env ]] && . "$HOME/.rokit/env"

if [[ -x $(command -v "asdf") ]]; then
    mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
    asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi

[[ -x $(command -v "pyenv") ]] && eval "$(pyenv init - zsh)"

[[ -x $(command -v "starship") ]] && eval "$(starship init zsh)"
