local spec = {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
}

spec.opts = {
    notification = {
        window = {
            winblend = 0,
            relative = "editor",
        },
    },
}

return { spec }
