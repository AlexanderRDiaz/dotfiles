#
# ~/.bash_profile
#

export XDG_CONFIG_HOME="$HOME/.config"
[[ -d $HOME/.pyenv ]] && export PYENV_ROOT=$HOME/.pyenv

[[ -d $HOME/.asdf ]] && export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
[[ -d $HOME/.pesde ]] && export PATH="$PATH:$HOME/.pesde/bin"

if [ $(uname) == "Darwin" ]; then
    [[ -d /opt/homebrew/opt/rustup/bin ]] && export PATH="$PATH:/opt/homebrew/opt/rustup/bin"
    [[ -d /opt/homebrew/bin ]] && export PATH="/opt/homebrew/bin:$PATH"
    [[ -d /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ $(uname) == "Linux" ]; then
    echo "Linux"
fi

if cat /proc/version | grep -q Linux; then
    export BROWSER="/mnt/c/Windows/explorer.exe"
fi

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PATH:$PYENV_ROOT/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc
