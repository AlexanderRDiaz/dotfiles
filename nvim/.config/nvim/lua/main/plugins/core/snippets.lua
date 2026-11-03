return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = { "InsertEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = function()
        local types = require("luasnip.util.types")

        return {
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "●", "GruvboxOrange" } },
                    },
                },
                [types.insertNode] = {
                    active = {
                        virt_text = { { "●", "GruvboxBlue" } },
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        local luasnip = require("luasnip")
        luasnip.config.setup(opts)
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
