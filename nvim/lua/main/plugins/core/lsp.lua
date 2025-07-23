local spec = { "mason-org/mason-lspconfig.nvim" }

spec.cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" }

spec.event = { "BufReadPre", "BufNewFile" }

spec.keys = {
    {
        "<leader>fm",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        mode = "n",
        desc = "Format buffer",
    },
}

spec.dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "zeioth/none-ls-autoload.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/lazydev.nvim",
    "lopi-py/luau-lsp.nvim",
    "b0o/SchemaStore.nvim",
}

spec.opts = {
    mason_lspconfig = {
        automatic_enable = {
            exclude = {
                "luau_lsp",
            },
        },
        ensure_installed = {
            "lua_ls",
            "jsonls",
            "pyright",
            "jdtls",
            "luau_lsp@1.48.0",
        },
    },
}

spec.config = function(_, opts)
    local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
    )
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
    vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git" },
    })

    vim.lsp.config("jsonls", require("main.plugins.lsp.jsonls"))
    vim.lsp.config("pyright", require("main.plugins.lsp.pyright"))
    vim.lsp.config("luau_lsp", require("main.plugins.lsp.luau_lsp").server)
    vim.lsp.config("taplo", require("main.plugins.lsp.taplo"))

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach", {}),
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

            if client.supports_method(client, "textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function(_)
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end,
                })
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover" })
            vim.keymap.set(
                "n",
                "gd",
                vim.lsp.buf.definition,
                { buffer = args.buf, desc = "Go to definition" }
            )
            vim.keymap.set(
                "n",
                "gD",
                vim.lsp.buf.declaration,
                { buffer = args.buf, desc = "Go to declaration" }
            )
            vim.keymap.set(
                "n",
                "gi",
                vim.lsp.buf.implementation,
                { buffer = args.buf, desc = "Go to implementation" }
            )
            vim.keymap.set(
                "n",
                "go",
                vim.lsp.buf.type_definition,
                { buffer = args.buf, desc = "Go to type definition" }
            )
            vim.keymap.set(
                "n",
                "gr",
                vim.lsp.buf.references,
                { buffer = args.buf, desc = "Go to references" }
            )
            vim.keymap.set(
                "n",
                "gs",
                vim.lsp.buf.signature_help,
                { buffer = args.buf, desc = "Signature help" }
            )
            vim.keymap.set(
                "n",
                "<leader>rn",
                vim.lsp.buf.rename,
                { buffer = args.buf, desc = "Rename word under cursor" }
            )
            vim.keymap.set(
                "n",
                "<leader>ca",
                vim.lsp.buf.code_action,
                { buffer = args.buf, desc = "Code action" }
            )
        end,
    })

    require("mason-lspconfig").setup(opts.mason_lspconfig)
    require("none-ls-autoload").setup {}

    require("luau-lsp").setup(require("main.plugins.lsp.luau_lsp").opts)
end

return spec
