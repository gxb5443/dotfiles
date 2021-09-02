-- Setting Leader Keys

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Editing

vim.opt = {
	tabstop = 4,
	shiftwidth = 4,
	smarttab = true,
	smartindent = true,
	textwidth = 80,

	joinspaces = true,
	-- Mouse Mode
	mouse = 'a',

	-- Searching,

	magic = true,
	showmatch = true,
	wrapscan = true,
	hlsearch = true,
	incsearch = true,
	infercase = true,

	ignorecase = true,
	smartcase = true,

	hidden = true,

	updatetime = 250,
	backup = false,
	wb = false,
	swapfile = false,
	showcmd = true,
	showmode = true,
	lazyredraw = true,

	number = true,
	relativenumber = true,

	fileformats = {"unix", "dos", "mac"},
	report = 0,
	errorbells = true,
	visualbell = true,
	backspace = {"eol", "start", "indent"},
}

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
