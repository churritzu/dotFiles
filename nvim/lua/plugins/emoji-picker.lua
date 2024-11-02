return {
	"allaman/emoji.nvim",
	version = "1.0.0", -- optionally pin to a tag
	ft = "markdown", -- adjust to your needs
	dependencies = {
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		enable_cmp_integration = true,
		-- optional if your plugin installation directory
		-- is not vim.fn.stdpath("data") .. "/lazy/
		-- plugin_path = vim.fn.expand("$HOME/plugins/"),
	},
	config = function(_, opts)
		require("emoji").setup(opts)
		-- optional for telescope integration
		local ts = require("telescope").load_extension("emoji")
		vim.keymap.set("n", "<leader>ee", ts.emoji, { desc = "[S]earch [E]moji" })
	end,
}
