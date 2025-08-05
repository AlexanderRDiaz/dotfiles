return {
    {
        "mason-org/mason.nvim",
        event = "VeryLazy",
        cmd = {
            "Mason",
            "MasonUpdate",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
        opts = {},
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                -- LSPs
                "lua_ls",
                { "luau_lsp", version = "v1.48.0" },
                "jdtls",
                "pyright",
                "taplo",
                "jsonls",
                -- Linters
                "selene",
                "ruff",
                -- Formatters
                "stylua",
            },
            auto_update = true,
            run_on_start = true,
            start_delay = 1000,
            debounce_hours = 2,
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = true,
                ["mason-nvim-dap"] = false,
            },
        },
    },
}
