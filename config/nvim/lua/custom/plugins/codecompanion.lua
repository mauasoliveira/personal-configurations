return {}

--[[
{
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "ravitemer/mcphub.nvim",
		},
		tag = "v17.33.0",
		version = "v17.33.0",
		config = function()
			require("codecompanion").setup({
				adapters = {
					acp = {
						opencode = function()
							return require("codecompanion.adapters").extend("opencode", {
								commands = {
									-- The default uses the opencode/config.json value
									default = {
										"opencode",
										"acp",
									},
									big_pickle = {
										"opencode",
										"acp",
										"-m",
										"big-pickle",
									},
									kimi_k2 = {
										"opencode",
										"acp",
										"-m",
										"kimi-k2",
									},
									kimi_k2_thinking = {
										"opencode",
										"acp",
										"-m",
										"kimi-k2-thinking",
									},
									qwen3_coder = {
										"opencode",
										"acp",
										"-m",
										"qwen3-coder",
									},
								},
							})
						end,
					},
				},
			})
		end,
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
		config = function()
			require("mcphub").setup()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	--[[
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},
	--]]
-- }
--
--]]
