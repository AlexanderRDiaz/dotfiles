return {
    "supermaven-inc/supermaven-nvim",
    enabled = false,
    event = "VeryLazy",
    cmd = {
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
    },
    opts = {
        keymaps = {
            accept_suggestion = "<C-a>a",
            clear_suggestion = "<C-a>c",
            accept_word = "<C-a>w",
        },
    },
}
