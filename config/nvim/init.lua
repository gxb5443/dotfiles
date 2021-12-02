-- Setting Leader Keys

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Editing

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.textwidth = 80

vim.o.joinspaces = true
-- Mouse Mode
vim.o.mouse = 'a'

-- Searching

vim.o.magic = true
vim.o.showmatch = true
vim.o.wrapscan = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.infercase = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hidden = true

vim.o.updatetime = 250
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false
vim.o.showcmd = true
vim.o.showmode = true
vim.o.lazyredraw = true

vim.o.number = true
vim.o.relativenumber = true

vim.opt.fileformats = {"unix", "dos", "mac"}
vim.o.report = 0
vim.o.errorbells = true
vim.o.visualbell = true
vim.opt.backspace = {"eol", "start", "indent"}

vim.o.termguicolors = true

-- Begin Initialization

local my_modules = {
	"mappings",
}

for i = 1, #my_modules, 1 do
	if not pcall(require, my_modules[i]) then
		error("Error loading " .. my_modules[i] .. "\n")
	end
end

require("mappings").misc()
