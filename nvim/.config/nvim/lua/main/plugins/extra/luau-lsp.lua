return {
    "lopi-py/luau-lsp.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "luau",
    cmd = "LuauLsp",
    config = function(_, _)
        require("luau-lsp").setup(require("main.plugins.lsp.luau_lsp").opts)
    end,
}
