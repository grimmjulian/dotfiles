local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ee', vim.cmd.Oil)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist)
-- gra for code actions
-- <C-w>d shows diagnostic at cursor in a floating window.

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set('n', '<leader>gl', vim.cmd.GV, { desc = 'Git log (oneline graph)', noremap = true, silent = true })
vim.keymap.set('n', '<leader>gfl', function() vim.cmd("GV!") end,
	{ desc = 'Git log (oneline graph)', noremap = true, silent = true })

vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-n>")

local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
