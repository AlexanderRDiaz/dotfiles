# Commands to run in interactive sessions can go here
if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end
pyenv init - fish | source

fish_add_path $HOME/.pesde/bin

switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/opt/rustup/bin
        eval "$(/opt/homebrew/bin/brew shellenv)"
end

starship init fish | source
