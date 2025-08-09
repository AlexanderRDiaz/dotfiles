local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    main = "nvim-treesitter.configs",
}

spec.cmd = {
    "TSInstall",
    "TSInstallSync",
    "TSInstallInfo",
    "TSUpdate",
    "TSUpdateSync",
    "TSUninstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSBufToggle",
    "TSEnable",
    "TSDisable",
    "TSToggle",
    "TSModuleInfo",
    "TSEditQuery",
    "TSEditQueryUserAfter",
}

spec.dependencies = {
    "RRethy/nvim-treesitter-endwise",
}

spec.opts = {
    auto_install = true,
    sync_install = true,
    ensure_installed = {
        "lua",
        "luau",
        "json",
        "jsonc",
        "toml",
        "vim",
        "vimdoc",
        "python",
    },
    highlight = {
        enable = true,
    },
    endwise = { enable = true },
}

return spec
