-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("main.util.python").setup()
require("set")

-- Setup lazy.nvim
require("lazy").setup {
    spec = {
        { import = "main.plugins.colors" },
        { import = "main.plugins.extra" },
        { import = "main.plugins.core" },
    },
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    checker = {
        enabled = true,
    },
    ui = {
        border = "rounded",
    },
    performance = {
        cache = {
            enabled = true,
            disable_events = { "VimEnter", "BufReadPre" },
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true,
            paths = {},
            disabled_plugins = {
                "gzip",
                "matchit",
                "spellfile",
                "shada",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

require("remap")
