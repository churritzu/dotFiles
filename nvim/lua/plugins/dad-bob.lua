return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		{ "pbogut/vim-dadbod-ssh" },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	config = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		-- let g:my_db = "ssh://192,168.0.100:mysql://root:toor@localhost/restaurants"
	end,
}
