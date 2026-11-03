return {
    {
        "nvimtools/none-ls.nvim",
        enabled = true,
        event = "VeryLazy",

        cmd = {
            "NullLsInfo",
            "NullLsLog",
        },

        opts = function()
            return {
                root_dir = require("null-ls.utils").root_pattern(
                    ".null-ls-root",
                    ".neoconf.json",
                    "Makefile",
                    ".git"
                ),
            }
        end,
    },

    {
        "zeioth/none-ls-autoload.nvim",
        event = { "BufReadPre", "BufNewFile" },
        enabled = true,
        dependencies = {
            "mason-org/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = false,
    },
}
