# source /etc/profile with bash for linux
if status is-login
    if uname | grep -q Linux
        if not set -q __sourced_profile
            set -x __sourced_profile 1
            exec bash -c "\
                test -e /etc/profile && source /etc/profile
                test -e $HOME/.bash_profile && source $HOME/.bash_profile
                exec fish --login
            "
        end
        
        set -e __sourced_profile
    end
end

# tmux cant handle xdg_config_home for some reason
set -Ux XDG_CONFIG_HOME $HOME/.config

# Commands to run in interactive sessions can go here
if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

fish_add_path $HOME/.pesde/bin

switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/opt/rustup/bin
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo "Hello Fish on Mac!"
    case Linux
        echo "Hello Fish on Arch!"
end

set -U fish_greeting

pyenv init - fish | source
starship init fish | source
