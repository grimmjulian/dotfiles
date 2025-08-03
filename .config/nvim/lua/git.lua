vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" }
})

vim.keymap.set("n", "<leader>gs", vim.cmd.LazyGit)
vim.keymap.set("n", "<leader>gl", vim.cmd.LazyGitLog)
