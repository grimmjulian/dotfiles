local pt = require("pickleterm")
pt.setup({
	R_CMD = {},
	R = { start_cmd = "radian" }
})

vim.keymap.set("n", "<leader>tt", function() pt.open("R") end)
vim.keymap.set("n",
	"<leader>dc",
	function() pt.send_cmd("R_CMD", "echo 'hello'") end
)

vim.keymap.set("n", "<leader>sl",
	function() pt.send_line("R") end)

vim.keymap.set("v", "<leader>ss",
	function() pt.send_visual("R") end)
vim.keymap.set("v", "<leader>sl",
	function() pt.send_visual("R") end)
vim.keymap.set("v", "<leader>s",
	function() pt.send_visual("R") end)
