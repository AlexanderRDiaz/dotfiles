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

fzf --fish | source
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

pyenv init - fish | source
starship init fish | source
