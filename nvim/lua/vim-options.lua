--
-- Globals
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

-- Tabs
-- vim.cmd("noremap <Tab> :tabnext<CR>")
-- vim.cmd("noremap <S-Tab> :tabprevious<CR>")

-- windows
vim.keymap.set("n", "<leader>nv", ":vsplit<cr>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>nh", ":sp<cr>", { desc = "Split Horizonal" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "All windows same size." })

-- Code
vim.keymap.set("n", "<A-/>", ":Commentary<cr>", { desc = "Toggle Comments" })
vim.keymap.set("n", "<localleader>rp", ":!./phpunit<cr>", { desc = "Run PHPUnit" })
