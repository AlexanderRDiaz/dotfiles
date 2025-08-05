set -U fish_greeting
fish_vi_key_bindings

source $XDG_CONFIG_HOME/fish/functions/env.fish

switch (uname)
    case Darwin
        source $XDG_CONFIG_HOME/fish/functions/mac.fish
    case Linux
        source $XDG_CONFIG_HOME/fish/functions/linux.fish
end

if cat /proc/version | grep -q WSL
    source $XDG_CONFIG_HOME/fish/functions/wsl.fish
end

source $XDG_CONFIG_HOME/fish/functions/colors.fish

source $XDG_CONFIG_HOME/fish/functions/source.fish
