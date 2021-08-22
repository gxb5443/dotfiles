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

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
         require "plugins.treesitter"
      end,
   }

   use {
	   "kabouzeid/nvim-lspinstall",
	   event = "BufRead",
   }

   use {
      "neovim/nvim-lspconfig",
	  after = "nvim-lspinstall",
      config = function()
         require "plugins.lspconfig"
      end,
   }

   use {
		"akinsho/nvim-bufferline.lua",
   }

   use {
	   "nvim-lua/plenary.nvim",
	   after = "nvim-bufferline.lua",
   }

   use {
	   "nvim-telescope/telescope.nvim",
	   after = "plenary.nvim",
	   requires = {
	       {
	    	   "nvim-telescope/telescope-fzf-native.nvim",
	    	   run = "make",
	       },
	   },
	   config = function()
		   require "plugins.telescope"
	   end,
	   setup = function()
		   require("mappings").telescope()
	   end
   }

end)
