return {
    "folke/lazydev.nvim",
    ft = { "lua" },
    opts = {
        debug = true,
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
