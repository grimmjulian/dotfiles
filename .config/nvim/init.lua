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
-- Treesitter

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "r", "dockerfile"},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		---@diagnostic disable-next-line: unused-local
		disable = function(lang, buf)
			local max_filesize = 100 * 1024   -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}

-- LSP
--
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})
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
