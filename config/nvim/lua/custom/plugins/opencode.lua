return {}
--[[{
	"opencode-ai/opencode.nvim",
	cmd = { "OpenCode", "OpenCodeChat" },
	opts = {
		backend = "ollama", -- or "openai"
		model = "deepseek-coder-v2",
		keymaps = {
			accept = "<C-y>",
			reject = "<C-n>",
		},
	},
}
 -- ]]
