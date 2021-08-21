local packer
local present, _ = pcall(require, "packerInit")

if present then
	packer = require "packer"
else
	return false
end

local use = packer.use

return packer.startup(function()
	use 'wbthomason/packer.nvim'

	use "alvan/vim-closetag"

	use {
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require "plugins.compe"
		end,
		wants = "LuaSnip",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				event = "InsertCharPre",
				config = function()
					require "plugins.luasnip"
				end,
			},
			{
				"rafamadriz/friendly-snippets",
				event = "InsertCharPre",
			},
		},
	}

	use {
		"windwp/nvim-autopairs",
		after = "nvim-compe",
		config = function()
			require "plugins.autopairs"
		end,
	}

   use {
      "andymass/vim-matchup",
      event = "CursorMoved",
   }

   use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
         require "plugins.nvimtree"
      end,
      setup = function()
         require("mappings").nvimtree()
      end,
   } 

  end)
