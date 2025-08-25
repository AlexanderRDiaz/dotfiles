local spec = {
    "L3MON4D3/LuaSnip",
}

spec.build = "make install_jsregexp"

spec.event = { "InsertEnter" }

spec.dependencies = { "rafamadriz/friendly-snippets" }

spec.opts = function()
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
end

spec.config = function(_, opts)
    local luasnip = require("luasnip")
    luasnip.config.setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
end

return spec
