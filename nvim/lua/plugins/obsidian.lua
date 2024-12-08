return {
	"epwalsh/obsidian.nvim",
	version = "*",
	-- lazy = true,
	-- ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		ui = {
			enable = true,
		},
		workspaces = {
			{
				name = "Tupa",
				path = "/home/tupa/Documents/TupaNotes",
			},
		},
		notes_subdir = "05 - Fleeting",
		new_notes_location = "05 - Fleeting",
		open_notes_in = "hsplit",
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
		note_frontmatter_func = function(note)
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,
		templates = {
			folder = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {},
		},
		daily_notes_template = {
			template = "daily-note-template.md",
		},

		daily_notes = {
			folder = "06 - Daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily-notes" },
			template = "daily-note-template.md",
		},

		follow_img_func = function(img)
			vim.fn.jobstart({ "xdg-open", img }) -- linux
		end,
		attachments = {
			img_folder = "Files",

			img_name_func = function()
				return string.format("%s-", os.time())
			end,

			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["<leader>of"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true, desc = "Open note under cursor" },
			},
			-- Toggle check-boxes.
			["<leader>oc"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true, desc = "Toggle checkbox" },
			},
			["<leader>ot"] = {
				action = ":ObsidianTags<cr>",
				opts = { buffer = true, desc = "Show tags" },
			},
			["<leader>oo"] = {
				action = ":ObsidianOpen<cr>",
				opts = { buffer = true, desc = "Open note in obsidian app" },
			},
			["<leader>oi"] = {
				action = ":ObsidianPasteImg<cr>",
				opts = { buffer = true, desc = "Paste image from clipboard" },
			},
			["<leader>ow"] = {
				action = ":ObsidianWorkspace<cr>",
				opts = { buffer = true, desc = "Switch workspace" },
			},
			["<leader>oll"] = {
				action = ":ObsidianLinks<cr>",
				opts = { buffer = true, desc = "Show links of current note" },
			},
			["<leader>oln"] = {
				action = ":ObsidianLink<cr>",
				opts = { buffer = true, desc = "Create new link" },
			},
			["<leader>onn"] = {
				action = ":ObsidianNew<cr>",
				opts = { buffer = true, desc = "Create New note" },
			},
			["<leader>ont"] = {
				action = ":ObsidianNewFromTemplate<cr>",
				opts = { buffer = true, desc = "Create New note from template" },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
}
