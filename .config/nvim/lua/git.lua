vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/junegunn/gv.vim" },
})

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = "eol"
	},
	numhl = false
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set('n', '<leader>gl', vim.cmd.GV, { desc = 'Git log (oneline graph)', noremap = true, silent = true })
vim.keymap.set('n', '<leader>gfl', function()vim.cmd("GV!")end, { desc = 'Git log (oneline graph)', noremap = true, silent = true })
