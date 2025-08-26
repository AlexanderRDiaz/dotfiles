return {
    "lopi-py/luau-lsp.nvim",
    ft = "luau",
    cmd = "LuauLsp",
    config = function(_, _)
        require("luau-lsp").setup(require("main.plugins.lsp.luau_lsp").opts)
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
}
