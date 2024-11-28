return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					-- ["<cr>"] = "open_tabnew"
				},
			},
		})
		vim.keymap.set("n", "<Space>e", ":Neotree float reveal toggle<CR>", { desc = "Reveal Neotree" })
		vim.keymap.set("n", "<leader>ep", ":Neotree float reveal buffers<CR>", { desc = "Reveal Neotree Buffers" })
		vim.keymap.set("n", "<leader>eg", ":Neotree float reveal git_status<CR>", { desc = "Reveal Neotree Git" })
	end,
}
