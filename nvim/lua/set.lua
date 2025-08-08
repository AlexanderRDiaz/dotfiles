local aug = vim.api.nvim_create_augroup("_config", {})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.guicursor = ""

vim.o.nu = true
vim.o.relativenumber = true

vim.o.wildmenu = false

vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 0
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.wrap = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 10
vim.o.signcolumn = "yes"

vim.o.updatetime = 16
vim.o.winborder = "rounded"

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = "*",
})
