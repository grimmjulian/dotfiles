local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ee', vim.cmd.Oil)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist)
-- gra for code actions

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set('n', '<leader>gl', vim.cmd.GV, { desc = 'Git log (oneline graph)', noremap = true, silent = true })
vim.keymap.set('n', '<leader>gfl', function() vim.cmd("GV!") end,
	{ desc = 'Git log (oneline graph)', noremap = true, silent = true })

vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-n>")
