return { "prisma/vim-prisma" }
--[[
return {
	"dastanaron/prisma.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("prisma").setup()
	end,
}
--]]
