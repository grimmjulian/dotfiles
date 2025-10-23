return{ 
	{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
	opts = {
		win_options = {
			signcolumn = "auto:2"
		},
		view_options = {
			show_hidden = true
		}
	},
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
},
{
  "refractalize/oil-git-status.nvim",

  dependencies = {
    "stevearc/oil.nvim",
  },

  config = true,
},

}
