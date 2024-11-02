return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				--				null_ls.builtins.formatting.prettier.with({
				--					filetypes = {
				--						"javascript", "javascriptreact",
				--						"typescript", "typescriptreact",
				--						"vue", "css", "scss", "less", "html", "json", "jsonc",
				--						"yaml", "markdown", "markdown.mdx", "graphql", "handlebars",
				--					},
				--				}),
				null_ls.builtins.formatting.prettier.with({
					command = "pretty-php", -- Comando para usar el formateador pretty-php
					filetypes = { "php" }, -- Configurar para archivos PHP
					args = { "--single-quote", "--brace-style", "1tbs" },
					extra_args = { "--single-quote", "--brace-style", "1tbs" },
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
-- local sources = {
--    null_ls.builtins.formatting.prettier.with({
--        extra_filetypes = { "toml" },
--    }),
--}
