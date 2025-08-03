vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" }
})

require("oil").setup({
	win_options = {
		-- cursorcolumn = true,
		signcolumn = "yes:2"
	},
	view_options = {
		show_hidden = true
	}

})

vim.keymap.set('n', '<leader>ee', vim.cmd.Oil)

vim.pack.add({
	{src = "https://github.com/refractalize/oil-git-status.nvim"}
})

require("oil-git-status").setup()
