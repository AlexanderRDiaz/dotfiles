local spec = { "neovim/nvim-lspconfig" }

spec.cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" }

spec.event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" }

spec.keys = {
    {
        "<leader>fm",
        function()
            require("lsp-format").format { buf = vim.api.nvim_get_current_buf() }
        end,
        mode = "n",
        desc = "Format buffer",
    },
}

spec.dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "mason-org/mason.nvim",
    "zeioth/none-ls-autoload.nvim",
    "folke/lazydev.nvim",
    "lopi-py/luau-lsp.nvim",
    "b0o/SchemaStore.nvim",
    "lukas-reineke/lsp-format.nvim",
}

spec.opts = function()
    local symbols = require("main.util.symbols")

    return {
        mason_lspconfig = {
            automatic_enable = {
                exclude = {
                    "luau_lsp",
                },
            },
        },
        diagnostics = {
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = symbols.diagnostics.error,
                    [vim.diagnostic.severity.WARN] = symbols.diagnostics.warn,
                    [vim.diagnostic.severity.HINT] = symbols.diagnostics.hint,
                    [vim.diagnostic.severity.INFO] = symbols.diagnostics.info,
                },
            },
        },
        inlay_hints = {
            enabled = false,
            exclude = {},
        },
        format = {
            exclude = {
                ts_ls = true,
            },
        },
    }
end

spec.config = function(_, opts)
    require("lsp-format").setup {}

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

            if not opts.format.exclude[client.name] then
                require("lsp-format").on_attach(client, args.buf)
            end

            if opts.inlay_hints.enabled then
                if
                    vim.api.nvim_buf_is_valid(args.buf)
                    and vim.bo[args.buf].buftype == ""
                    and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[args.buf].filetype)
                then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end
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

    local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("blink.cmp").get_lsp_capabilities()
    )
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

    vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git" },
    })

    vim.lsp.config("jsonls", require("main.plugins.lsp.jsonls"))
    vim.lsp.config("pyright", require("main.plugins.lsp.pyright"))
    vim.lsp.config("taplo", require("main.plugins.lsp.taplo"))

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    require("mason-lspconfig").setup(opts.mason_lspconfig)
    require("none-ls-autoload").setup {}

    vim.lsp.config("luau_lsp", require("main.plugins.lsp.luau_lsp").server)
    require("luau-lsp").setup(require("main.plugins.lsp.luau_lsp").opts)
end

return spec
