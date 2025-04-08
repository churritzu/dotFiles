--
-- Globals
--
vim.g.mapleader = ","
vim.g.maplocalleader = "m"

vim.cmd("set expandtab")
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.mouse = "a"
vim.o.colorcolumn = "80"

-- Folding
vim.o.foldenable = true
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "1"

-- For Obsidian
vim.o.conceallevel = 1

--
-- Insert Mode
--
vim.cmd("imap jj <Esc>")

--
-- Normal Mode
--

-- Navegation
vim.keymap.set("n", "<leader>h", ":wincmd h<cr>", { desc = "Move to left pane" })
vim.keymap.set("n", "<leader>j", ":wincmd j<cr>", { desc = "Move to down pane" })
vim.keymap.set("n", "<leader>k", ":wincmd k<cr>", { desc = "Move to up pane" })
vim.keymap.set("n", "<leader>l", ":wincmd l<cr>", { desc = "Move to right pane" })
vim.keymap.set("n", "<leader>ek", "<C-w>r", { desc = "Swap Vertical" })
vim.keymap.set("n", "<leader>el", "<C-w>R", { desc = "Swap Horizonal" })

vim.keymap.set("n", "<C-h>", ":vertical resize -3<CR>", { desc = "Vertical Resize Right" })
vim.keymap.set("n", "<C-k>", ":resize -3<CR>", { desc = "Vertical Resize Up" })
vim.keymap.set("n", "<C-l>", ":vertical resize +3<CR>", { desc = "Vertical Resize Left" })
vim.keymap.set("n", "<C-j>", ":resize +3<CR>", { desc = "Vertical Resize Down" })

-- windows
vim.keymap.set("n", "<leader>sv", ":vs<cr>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>sh", ":sp<cr>", { desc = "Split Horizonal" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "All windows same size." })

-- Notifications
vim.keymap.set("n", "<leader>nf", ":NoiceTelescope<cr>", { desc = "Telescope Notifications" })
vim.keymap.set("n", "<leader>nl", ":NoiceLast<cr>", { desc = "Last Notifications" })
vim.keymap.set("n", "<leader>na", ":NoiceAll<cr>", { desc = "Last Notifications" })

-- Code
vim.keymap.set("n", "<leader>cz", ":Twilight<cr>", { desc = "Toggle Twilight Focus" })

-- Para JavaScript
vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<localleader>r",
			":w<CR>:!node %<CR>",
			{ desc = "Run File", noremap = true, silent = true }
		)
	end,
})

-- Para PHP
vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<localleader>r",
			":w<CR>:!php %<CR>",
			{ desc = "Run File", noremap = true, silent = true }
		)
	end,
})

-- Para Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<localleader>r",
			":w<CR>:!python %<CR>",
			{ desc = "Run File", noremap = true, silent = true }
		)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal wrap",
})
