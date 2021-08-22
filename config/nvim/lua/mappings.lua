local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
	local options = { noremap = treu, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local M = {}
local opt = {}

M.misc = function()
	map("v", "p", '"_dP', opt)

	map("n", "\\", ":set relativenumber!", opt)

   -- Packer commands till because we are not loading it at startup
   cmd "silent! command PackerCompile lua require 'pluginList' require('packer').compile()"
   cmd "silent! command PackerInstall lua require 'pluginList' require('packer').install()"
   cmd "silent! command PackerStatus lua require 'pluginList' require('packer').status()"
   cmd "silent! command PackerSync lua require 'pluginList' require('packer').sync()"
   cmd "silent! command PackerUpdate lua require 'pluginList' require('packer').update()"

end

M.nvimtree = function()
   map("n", "nn", ":NvimTreeToggle<CR>", opt)
end

M.telescope = function()
	local m = {
      live_grep = "<leader>fw",
      git_status = "<leader>gt",
      git_commits = "<leader>cm",
      find_files = "<leader>ff",
      buffers = "<leader>fb",
      help_tags = "<leader>fh",
      oldfiles = "<leader>fo",
   }

   map("n", m.live_grep, ":Telescope live_grep<CR>", opt)
   map("n", m.git_status, ":Telescope git_status <CR>", opt)
   map("n", m.git_commits, ":Telescope git_commits <CR>", opt)
   map("n", m.find_files, ":Telescope find_files <CR>", opt)
   map("n", m.buffers, ":Telescope buffers<CR>", opt)
   map("n", m.help_tags, ":Telescope help_tags<CR>", opt)
   map("n", m.oldfiles, ":Telescope oldfiles<CR>", opt)

end

return M
