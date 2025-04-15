return {
	{
		"folke/which-key.nvim",
		event="VeryLazy",
		opts = { },
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{ "<leader>b", group = "Debugging" },
			{ "<leader>d", group = "Delete/Close" },
			{ "<leader>f", group = "File" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>s", group = "Search" },
			{ "<leader>u", group = "UI" },
		}

	}
}
