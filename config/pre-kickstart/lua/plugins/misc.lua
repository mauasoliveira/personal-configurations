-- Miscelaneous fun stuff
return {

	--[[
	{ 'echasnovski/mini.nvim', version = '*' },
	{ 'echasnovski/mini.icons', version = false, 
		config=function()
			require('mini.icons').setup()
		end,

	},
	-- Move stuff with <M-j> and <M-k> in both normal and visual mode
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
	--]]
	
	-- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
}
