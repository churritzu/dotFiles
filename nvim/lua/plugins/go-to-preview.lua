return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = true,
	keys = {
		{
			"gpd",
			"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
			desc = "Go to preview definition",
		},
		{
			"gpt",
			"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
			desc = "Go to preview type definition",
		},
		{
			"gpi",
			"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
			desc = "Go to preview implementation",
		},
		{
			"gpD",
			"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
			desc = "Go to preview declaration",
		},
		{
			"gP",
			"<cmd>lua require('goto-preview').close_all_win()<CR>",
			desc = "Close all preview windows",
		},
		{
			"gpr",
			"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
			desc = "Go to preview references",
		},
	},
}
