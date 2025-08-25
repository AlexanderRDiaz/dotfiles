local spec = {
    "saghen/blink.cmp",
    version = "1.*",
}

spec.dependencies = {
    "L3MON4D3/LuaSnip",
    "supermaven-inc/supermaven-nvim",
}

spec.opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = { documentation = { auto_show = true } },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    snippets = { preset = "luasnip" },
    cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
    },
}

spec.opts_extend = { "sources.default" }

return spec
