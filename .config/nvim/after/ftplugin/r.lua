vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

local function switchRTerminal(cmd)
	local target_name = "R_Terminal"
	local existing_buf = nil

	-- Loop over all listed buffers and check names
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf):match(target_name) then
			existing_buf = buf
			break
		end
	end

	if existing_buf then
		-- Buffer exists → switch to its window or open it in split if not visible
		local win_found = false
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == existing_buf then
				vim.api.nvim_set_current_win(win)
				vim.cmd.startinsert()
				win_found = true
				break
			end
		end
		if not win_found then
			vim.cmd.split()
			vim.api.nvim_set_current_buf(existing_buf)
			vim.cmd.startinsert()
		end
	else
		-- Create new terminal buffer
		vim.cmd.split()
		vim.cmd.terminal("R -q -e '1+1;interactive()'")
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_name(buf, target_name)
		vim.cmd.startinsert()
	end
end

vim.keymap.set("n", "<leader>rt", switchRTerminal)
