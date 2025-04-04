return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"angularls",
					"bashls",
					"cssls",
					"css_variables",
					"dockerls",
					"docker_compose_language_service",
					"emmet_ls",
					"html",
					"ts_ls",
					"eslint",
					"jsonls",
					"lua_ls",
					"markdown_oxide",
					"intelephense",
					"tailwindcss",
					"pyright",
					"vuels",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.angularls.setup({ capabilities })
			lspconfig.bashls.setup({ capabilities })
			lspconfig.cssls.setup({ capabilities })
			lspconfig.css_variables.setup({ capabilities })
			lspconfig.dockerls.setup({ capabilities })
			lspconfig.docker_compose_language_service.setup({ capabilities })
			lspconfig.emmet_ls.setup({ capabilities })
			lspconfig.html.setup({ capabilities })
			lspconfig.ts_ls.setup({ capabilities })
			lspconfig.eslint.setup({ capabilities })
			lspconfig.jsonls.setup({ capabilities })
			lspconfig.lua_ls.setup({ capabilities })
			lspconfig.intelephense.setup({ capabilities })
			lspconfig.pyright.setup({ capabilities })
			lspconfig.vuels.setup({ capabilities })
			lspconfig.yamlls.setup({ capabilities })
			lspconfig.markdown_oxide.setup({ capabilities })
			lspconfig.tailwindcss.setup({
				capabilities,
				filetypes = { "html", "css", "vue", "javascript", "svelte", "typescript" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<leader>co", vim.lsp.buf.document_symbol, { desc = "Go to document symbol" })
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "Rename all references" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
