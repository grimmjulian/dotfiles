vim.lsp.enable({
	"lua_ls",
	"r_language_server",
	"air"
})


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
