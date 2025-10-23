require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_tressitter#expr"
vim.opt.foldlevel = 2

-- vim.g.mapleader is defined in config.lazy

require("lsp")
require("keymaps")
require("listchars")
