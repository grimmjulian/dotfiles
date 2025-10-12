vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false


local function is_r_ready()
	bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	-- Iterate backwards to find the last non-empty line
	for i = #lines, 1, -1 do
		local line = lines[i]
		if line and line:match("%S") then -- non-empty line
			-- Return true if the last non-empty line looks like an R prompt
			return line:match("> $") or line:match("%+ $") or line:match("Browse%[%d+%]> $")
		end
	end

	return false
end

local function my_r_term(name, auto_cmd)
	local existing_buf = buf_exists(name)
	my_term(name, "R")
	if existing_buf == nil then
		local buf = vim.b.terminal_job_id
		local cmd = auto_cmd .. "\n"
		vim.api.nvim_chan_send(buf, cmd)
	end
	if is_r_ready() then
		local buf = vim.b.terminal_job_id
		local cmd = auto_cmd .. "\n"
		vim.api.nvim_chan_send(buf, cmd)
	end
end

vim.keymap.set("n", "<leader>tr", function() my_term("R_terminal", "R") end)
-- vim.keymap.set('n', '<leader>dt', function() my_term("devtools", "R", "devtools::test()") end)
vim.keymap.set("n", "<leader>dt", function() my_r_term("devtools", "devtools::test()") end)
vim.keymap.set("n", "<leader>dc", function() my_r_term("devtools", "devtools::check()") end)
vim.keymap.set('n', '<leader>sra', function() my_r_term("shiny::runApp", "source('app.R')") end)
vim.keymap.set("n", "<leader>tt", function()
	my_r_term("test_r", 1 + 1)
end)
