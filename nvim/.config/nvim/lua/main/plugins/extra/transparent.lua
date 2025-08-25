local spec = {
    "xiyaowong/transparent.nvim",
    enabled = true,
    lazy = false,
    priority = 1001,
}
spec.cmd = { "TransparentToggle", "TransparentEnable", "TransparentDisable" }

spec.keys = {
    { "<leader>tt", "<cmd>TransparentToggle<CR>", { mode = "n", desc = "Toggle transparency" } },
}

spec.opts = {
    extra_groups = {
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "WinSeparator",
        "NormalSB",
        "Folded",
        "NonText",
        "SpecialKey",
        "VertSplit",
        "EndOfBuffer",
        "SignColumn",
        "TroubleNormal",
        "TroubleNormalNC",
        "MasonNormal",
        "LazyNormal",
        "LazyButton",
        "WhichKeyNormal",
        "WhichKeyTitle",
        "StatusLine",
        "StatusLineNC",
        "Tabline",
        "TabLineFill",
        "TabLineSel",
        "Winbar",
        "WinbarNC",
    },
}

return spec
