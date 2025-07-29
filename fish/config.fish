# source /etc/profile with bash for linux if status is-login
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

set -U fish_greeting
# tmux cant handle xdg_config_home for some reason
set -Ux XDG_CONFIG_HOME $HOME/.config

# Commands to run in interactive sessions can go here
if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end


switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/opt/rustup/bin
        eval "$(/opt/homebrew/bin/brew shellenv)"
    case Linux
        # ASDF configuration code
        if test -z $ASDF_DATA_DIR
            set _asdf_shims "$HOME/.asdf/shims"
        else
            set _asdf_shims "$ASDF_DATA_DIR/shims"
        end

        # Do not use fish_add_path (added in Fish 3.2) because it
        # potentially changes the order of items in PATH
        if not contains $_asdf_shims $PATH
            set -gx --prepend PATH $_asdf_shims
        end
        set --erase _asdf_shims

        asdf completion fish > ~/.config/fish/completions/asdf.fish
end

fish_add_path $HOME/.rokit/bin
fish_add_path $HOME/.pesde/bin

pyenv init - fish | source
starship init fish | source
