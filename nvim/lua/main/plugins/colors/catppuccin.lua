local spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = true,
    priority = 1000,
}

spec.opts = {
    flavour = "mocha",
    background = { light = "latte", dark = "mocha" },
    transparent_background = vim.g.transparent_enabled,
    term_colors = true,
}

spec.config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

return spec
