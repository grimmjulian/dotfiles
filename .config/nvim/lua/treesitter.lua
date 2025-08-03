vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"r",
		"dockerfile",
		"json",
		"toml",
		"yaml" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		---@diagnostic disable-next-line: unused-local
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}
