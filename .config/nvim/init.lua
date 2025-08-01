vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_tressitter#expr"
vim.opt.foldlevel = 2

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>so', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>ee', ':Exp<CR>')

vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
})
vim.cmd("colorscheme carbonfox")

require("treesitter")
require("lsp")
require("git")
