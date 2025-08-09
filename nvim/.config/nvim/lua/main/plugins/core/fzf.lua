local spec = { "ibhagwan/fzf-lua" }
spec.cmd = "FzfLua"

spec.dependencies = { "nvim-tree/nvim-web-devicons" }

spec.keys = {
    {
        "<leader>ff",
        "<cmd>FzfLua files<cr>",
        desc = "FZF: Find files",
    },
    {
        "<leader>fg",
        "<cmd>FzfLua live_grep<cr>",
        desc = "FZF: Live grep",
    },
    {
        "<leader>fb",
        "<cmd>FzfLua buffers<cr>",
        desc = "FZF: Buffers",
    },
    {
        "<leader>fh",
        "<cmd>FzfLua helptags<cr>",
        desc = "FZF: Help tags",
    },
}

spec.opts = {
    winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
            scrollchars = { "┃", "" },
        },
    },
}

spec.config = function(_, opts)
    local fzf = require("fzf-lua")

    fzf.config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    fzf.config.defaults.keymap.fzf["ctrl-k"] = "half-page-up"
    fzf.config.defaults.keymap.fzf["ctrl-j"] = "half-page-down"
    fzf.config.defaults.keymap.fzf["ctrl-x"] = "jump"
    fzf.config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
    fzf.config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
    fzf.config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
    fzf.config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"

    if package.loaded["trouble"] then
        fzf.config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
    end

    fzf.setup(opts)
end

return spec
