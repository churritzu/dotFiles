return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		enabled = false,
		-- or just leave it empty :)
	},
}
