return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",

			-- For ultisnips users.
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",

			-- For Friendly
			"rafamadriz/friendly-snippets", -- for autocompletion
			"onsails/lspkind.nvim", -- Vscode like pictogramas

			--  For vsnip users.
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",

			-- For snippy users.
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			-- local snippy = require("snippy")
			local lspkind = require("lspkind")

			require("luasnip.loaders.from_vscode")

			cmp.setup({
				completion = {
					completionopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- snippy.expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- lspkind.expand_snippet(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-,>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "supermaven" },
					{ name = "vsnip" }, -- For vsnip users.
					{ name = "ultisnips" }, -- For ultisnips users.
					{ name = "emoji" },
					{ name = "snippy" }, -- For snippy users.
					{ name = "path" },
				}),
				---@diagnostic disable-next-line: missing-fields
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = {
							supermaven = "",
							Text = "",
							Method = "",
							Function = "",
							Constructor = "",
							Field = "ﰠ",
							Variable = "",
							Class = "ﴯ",
							Interface = "",
							Module = "",
							Property = "ﰠ",
							Unit = "塞",
							Value = "",
							Enum = "",
							Keyword = "",
							Snippet = "",
							Color = "",
							File = "",
							Reference = "",
							Folder = "",
							EnumMember = "",
							Constant = "",
							Struct = "פּ",
							Event = "",
							Operator = "",
							TypeParameter = "",
						},
					}),
				},
			})

			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				---@diagnostic disable-next-line: missing-fields
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
}
