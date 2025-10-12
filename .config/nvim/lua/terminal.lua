--[[
Folgende usecases:

- Ein Terminalpane öffnen mit R oder Bash
- Wenn das Pane sichtbar ist, soll es fokusiert werden.
  Falls das Pane nicht sichtbar war, aber der buffer existiert, soll der buffer wieder geöffnet werden.
- Terminal soll so geöffnet werden wie :term, kein floating
- Kein startinsert
- Für R existiert eine subfunction die auch checkt ob R ready ist (siehe ftp file)
--]]
function buf_exists(name)
	local existing_buf = nil

	-- Look for existing terminal buffer
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf)
				and vim.api.nvim_buf_get_name(buf):match(name) then
			existing_buf = buf
			break
		end
	end
	return existing_buf
end

function my_term(name, start_cmd)
	name = name or "my_terminal"
	local target_name = name
	local existing_buf = buf_exists(name)

	local open_terminal = function()
		if start_cmd and start_cmd ~= "" then
			vim.cmd.terminal(vim.fn.shellescape(start_cmd))
		else
			vim.cmd.terminal()
		end
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_name(buf, target_name)
		return buf
	end

	if existing_buf then
		local win_found = false
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == existing_buf then
				vim.api.nvim_set_current_win(win)
				win_found = true
				break
			end
		end
		if not win_found then
			vim.api.nvim_set_current_buf(existing_buf)
			vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(0), 0 })
		end
	else
		open_terminal()
	end
end

vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-n>")
vim.keymap.set('n', '<leader>tb', my_term)
