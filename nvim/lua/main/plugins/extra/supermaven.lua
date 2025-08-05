local spec = {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
}

spec.cmd = {
    "SupermavenStart",
    "SupermavenStop",
    "SupermavenRestart",
    "SupermavenToggle",
    "SupermavenStatus",
    "SupermavenUseFree",
    "SupermavenUsePro",
    "SupermavenLogout",
    "SupermavenShowLog",
    "SupermavenClearLog",
}

spec.opts = {
    keymaps = {
        accept_suggestion = "<C-a>a",
        clear_suggestion = "<C-a>c",
        accept_word = "<C-a>w",
    },
}

return spec
