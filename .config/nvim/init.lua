vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

vim.g.mapleader = " "

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.keymap.set('n', '<leader>so', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>ee', ':Exp<CR>')

-- LSP
vim.lsp.config('lua_ls', {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
					path ~= vim.fn.stdpath('config')
					and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				version = 'LuaJIT',
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				}
			}
		})
	end,
	settings = {
		Lua = {}
	}
})

vim.lsp.enable({ "lua_ls", "r_language_server", "dockerls" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
---@diagnostic disable-next-line: need-check-nil
		if client:supports_method('textDocument/completion') then
---@diagnostic disable-next-line: need-check-nil
			vim.lsp.completion.enable(true, client.id, ev.buf)
		end
	end
})
vim.cmd("set completeopt+=noselect")
