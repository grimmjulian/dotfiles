vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>so', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>ee', ':Exp<CR>')
-- Colorscheme
--

vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
})
vim.cmd("colorscheme carbonfox")

require("treesitter")
require("lsp")
