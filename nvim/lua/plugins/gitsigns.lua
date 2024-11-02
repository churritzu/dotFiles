return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>sS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>ss", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("v", "<leader>ss", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage Hunk On Visual Mode" })
				map("n", "<leader>sR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>sr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("v", "<leader>sr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset Hunk On Visual Mode" })
				map("n", "<leader>su", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
				map("n", "<leader>sp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>sb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame Line" })
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
				map("n", "<leader>sd", gitsigns.diffthis, { desc = "Diff This" })
				map("n", "<leader>sD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff This Against Index" })
				map("n", "<leader>td", gitsigns.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
			end,
		})
	end,
}
