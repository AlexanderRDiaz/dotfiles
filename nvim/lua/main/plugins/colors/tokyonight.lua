local spec = {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
}

spec.opts = {
    style = "night",
    transparent = vim.g.transparent_enabled,
    terminal_colors = true,
}

spec.config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"
end

return spec
