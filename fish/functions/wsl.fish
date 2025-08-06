if cat /proc/version | grep -q WSL 
    export BROWSER="/mnt/c/Windows/explorer.exe"
end

function nvim
    if not pidof socat > /dev/null 2>&1
        test -e /tmp/discord-ipc-0 && rm -f /tmp/discord-ipc-0
        socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
            EXEC:"npiperelay.exe //./pipe/discord-ipc-0" 2>/dev/null &
    end

    command nvim $argv
end
