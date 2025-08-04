vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }
})

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = "eol"
	},
	numhl = false
})

vim.keymap.set("n", "<leader>gs", vim.cmd.LazyGit)
vim.keymap.set("n", "<leader>gl", vim.cmd.LazyGitLog)
vim.keymap.set("n", "<leader>gd", vim.cmd.Gitsigns({args = {"toggle_deleted"}}))
