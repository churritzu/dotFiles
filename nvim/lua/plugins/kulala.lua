return {
	"mistweaverco/kulala.nvim",
	opts = {},
	config = function()
		require("kulala").setup({
			split_direction = "horizontal",
			display_mode = "split", -- float
			q_to_close_float = true,
			default_winbar_panes = { "body", "headers", "headers_body", "stats", "script_output", "verbose" },
			winbar = true,
			certificates = {
				["localhost"] = {
					cert = "/mnt/b320/Work/Web/localhost.crt",
					key = "/mnt/b320/Work/Web/localhost.key",
				},
				["barney.local"] = {
					cert = "/mnt/b320/Work/Web/localhost.crt",
					key = "/mnt/b320/Work/Web/localhost.key",
				},
			},
		})
		vim.keymap.set(
			"n",
			"<leader>ra",
			"<cmd>lua require('kulala').run_all()<CR>",
			{ noremap = true, desc = "Execute all request in the current buffer" }
		)
		vim.keymap.set(
			"n",
			"<leader>rr",
			"<cmd>lua require('kulala').run()<CR>",
			{ noremap = true, desc = "Execute the Request" }
		)
		vim.keymap.set(
			"n",
			"<leader>ri",
			"<cmd>lua require('kulala').inspect()<CR>",
			{ noremap = true, desc = "Inspect the Request" }
		)
		vim.keymap.set(
			"n",
			"<leader>rs",
			"<cmd>lua require('kulala').show_stats()<CR>",
			{ noremap = true, desc = "Show status of the last Request" }
		)
		vim.keymap.set(
			"n",
			"<leader>rt",
			"<cmd>lua require('kulala').scrathcpad()<CR>",
			{ noremap = true, desc = "Show scratchpad" }
		)
	end,
}
