local M = {}

M.config = {
	default = {
		startup_cmd = "echo 'hello world'",
		shell_prompt = ">"
	},
	terminals = {
		r = {startup_cmd = "R --quiet"}
	}
}

M.terminals = {}

function M.buf_exists(name)
	name = name or "default"
	if M.terminals[name] == nil then
		return false
	end
	is_valid = vim.api.nvim_buf_is_valid(M.terminals[name].bufnr)
	return is_valid
end

function M.get_buf_nr(name)
	return M.terminals[name].bufnr
end

function M.get_buf_win(name)
	buf = M.terminals[name].bufnr
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_buf(win) == buf then
			return win
		end
	end
	return nil
end

function M.create(name) 
	name = name or "default"
	vim.cmd.terminal()

	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_name(buf, "term://"..name)
	if M.terminals[name] == nil then
		default = M.config.default or {}
		specific = M.config.terminals[name] or {}
		M.terminals[name] = vim.tbl_deep_extend("force", default, specific)
	end
	M.terminals[name].bufnr = buf
	M.send(name, M.terminals[name].startup_cmd)
end

function M.open(name)
	name = name or "default"
	if M.buf_exists(name) then
		vim.api.nvim_set_current_buf(M.terminals[name].bufnr)
		return
	end
	M.create(name)
end

function M.list()
	print(vim.inspect(M.terminals))
end

function M.send(name, cmd)
	M.open(name)
	local buf = M.get_buf_nr(name)
	local job_id = vim.b[buf].terminal_job_id
	if job_id == nil then
		return nil
	end
	if (M.is_idle(name)) then
		vim.api.nvim_chan_send(job_id, cmd.."\n")
	end
end

function M.get_last_line(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, -20, -1, false)
  local last_line = ""
  for i = #lines, 1, -1 do
    if lines[i] and lines[i]:match("%S") then
      last_line = lines[i]
      break
    end
  end
	return last_line
end

function M.is_idle(name) 
	buf_nr = M.get_buf_nr(name)
	shell_prompt = M.terminals[name].shell_prompt
	if buf_nr == nil then
		return false
	elseif shell_prompt == nil then
		return true
	end
	last_line = M.get_last_line(buf_nr)
	r = last_line:match(shell_prompt)
	if r then
		return true
	else 
		return false
	end
end

return M
