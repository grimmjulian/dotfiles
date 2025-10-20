vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false


local function is_r_ready()
	local bufnr = vim.api.nvim_get_current_buf()
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

local function file_contains(filepath, search_str)
	local file = io.open(filepath, "r")
	if not file then return false end
	local content = file:read("*all")
	file:close()
	return content:find(search_str) ~= nil
end

local test_cmd = ""
local check_cmd = ""

if file_contains("DESCRIPTION", "testthat") then
	test_cmd = "devtools::test()"
	check_cmd = "devtools::check()"
elseif file_contains("DESCRIPTION", "tinytest") then
	test_cmd = "pkgload::load_all('.');tinytest::test_all()"
else
	test_cmd = "message('Neither testthat nor tinytest found.')"
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
vim.keymap.set(
	"n",
	"<leader>dt",
	function() my_r_term("devtools", test_cmd) end
)
vim.keymap.set(
	"n",
	"<leader>dc",
	function()
		if check_cmd == "" then
			my_term("R_CMD", nil)
			local buf = vim.b.terminal_job_id
			local cmd = "R CMD check .\n"
			vim.api.nvim_chan_send(buf, cmd)
		else
			my_r_term("devtools", "devtools::check()")
		end
	end
)
vim.keymap.set('n', '<leader>sra', function() my_r_term("shiny::runApp", "source('app.R')") end)
