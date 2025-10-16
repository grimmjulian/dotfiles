vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" }
})

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = "eol"
	},
	numhl = false
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set('n', '<leader>gl', function()
  vim.cmd('Git log --oneline --all --graph --decorate')
end, { desc = 'Git log (oneline graph)', noremap = true, silent = true })
