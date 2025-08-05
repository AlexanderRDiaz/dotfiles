set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux EDITOR nvim

if test -d $HOME/.pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
end

if test -d $PYENV_ROOT/bin 
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

if test -d $HOME/.asdf
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

if test -d $HOME/.pesde
    fish_add_path $HOME/.pesde/bin
end

if not path filter -f -x $HOME/.rokit/env
    fish_add_path $HOME/.rokit/bin
end