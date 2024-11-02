return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			ensure_installed = {
				"angular",
				"bash",
				"css",
				"dockerfile",
				"diff",
				"gitignore",
				"query",
				"html",
				"http",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"regex",
				"sql",
				"scss",
				"typescript",
				"tsx",
				"vim",
				"vue",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
