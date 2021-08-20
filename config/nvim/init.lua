local opt = vim.opt
local wo = vim.wo
local g = vim.g

-- Setting Leader Keys

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Editing

opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.smartindent = true
opt.textwidth = 80

opt.joinspaces = true

-- Mouse Mode

opt.mouse = 'a'

-- Searching

opt.magic = true
opt.showmatch = true
opt.wrapscan = true
opt.hlsearch = true
opt.incsearch = true
opt.infercase = true

opt.ignorecase = true
opt.smartcase = true

opt.hidden = true

opt.updatetime = 250
opt.backup = false
opt.wb = false
opt.swapfile = false
opt.showcmd = true
opt.showmode = true
opt.lazyredraw = true

opt.number = true
opt.relativenumber = true

opt.fileformats = {"unix", "dos", "mac"}
opt.report = 0
opt.errorbells = true
opt.visualbell = true
opt.backspace = {"eol", "start", "indent"}
