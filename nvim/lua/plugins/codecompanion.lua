return {
	"olimorris/codecompanion.nvim",
	enabled = false,
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	setup = function()
		require("codecompanion").setup({
			adapter = function()
				return require("codecompanion.adapters").extend("gemini", {
					name = "gemini",
					schema = {
						model = {
							default = "gemini-2.0-flash",
						},
					},
					env = {
						api_key = os.getenv("GEMINI_KEY"),
					},
				})
			end,
		})
	end,
}
