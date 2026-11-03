return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    cmd = {
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
    },
    dependencies = {
        "RRethy/nvim-treesitter-endwise",
    },
    opts = {
        languages = {
            "lua",
            "luau",
            "javascript",
            "typescript",
            "json",
            "toml",
            "vim",
            "vimdoc",
            "python",
            "yaml",
            "java",
            "gitignore",
            "gitattributes",
            "fish",
        },
        highlight = {
            enable = true,
        },
        endwise = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        local ts = require("nvim-treesitter")
        ts.setup()
        ts.install(opts.languages)
        ts.update(opts.languages)
    end,
}
