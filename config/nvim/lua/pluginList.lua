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
      cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
      config = function()
    	require'nvim-tree'.setup {}
    	require "plugins.nvimtree"
      end,
      setup = function()
        require("mappings").nvimtree()
      end,
   } 

	--use {
	--  "nvim-neo-tree/neo-tree.nvim",
	--	branch = "v1.x",
	--	requires = { 
	--	 	"nvim-lua/plenary.nvim",
	--	  	"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	--		"MunifTanjim/nui.nvim" 
	--	},
	--	config = function ()
	--	  require("neo-tree").setup({
	--		popup_border_style = "rounded",
	--		filesystem = {
	--		  window = {
	--			mappings = {
	--			  ["<2-LeftMouse>"] = "open",
	--			  ["<cr>"] = "open",
	--			  ["S"] = "open_split",
	--			  ["s"] = "open_vsplit",
	--			  ["C"] = "close_node",
	--			  ["<bs>"] = "navigate_up",
	--			  ["."] = "set_root",
	--			  ["H"] = "toggle_hidden",
	--			  ["I"] = "toggle_gitignore",
	--			  ["R"] = "refresh",
	--			  ["/"] = "filter_as_you_type",
	--			  ["f"] = "filter_on_submit",
	--			  ["<c-x>"] = "clear_filter",
	--			  ["a"] = "add",
	--			  ["d"] = "delete",
	--			  ["r"] = "rename",
	--			  ["c"] = "copy_to_clipboard",
	--			  ["x"] = "cut_to_clipboard",
	--			  ["p"] = "paste_from_clipboard",
	--			}
	--		  }
	--		},
	--		git_status = {
	--		  window = {
	--			mappings = {
	--			  ["<2-LeftMouse>"] = "open",
	--			  ["<cr>"] = "open",
	--			  ["S"] = "open_split",
	--			  ["s"] = "open_vsplit",
	--			  ["C"] = "close_node",
	--			  ["R"] = "refresh",
	--			  ["d"] = "delete",
	--			  ["r"] = "rename",
	--			  ["c"] = "copy_to_clipboard",
	--			  ["x"] = "cut_to_clipboard",
	--			  ["p"] = "paste_from_clipboard",
	--			  ["A"]  = "git_add_all",
	--			  ["gu"] = "git_unstage_file",
	--			  ["ga"] = "git_add_file",
	--			  ["gr"] = "git_revert_file",
	--			  ["gc"] = "git_commit",
	--			  ["gp"] = "git_push",
	--			  ["gg"] = "git_commit_and_push",
	--			}
	--		  }
	--		}
	--	  }) 
	--	  vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
	--	end
	--}

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

   --use {
   --   "neovim/nvim-lspconfig",
   --   after = "nvim-lspinstall",
   --   config = function()
   --      require "plugins.lspconfig"
   --   end,
   --}

   use {
		'neovim/nvim-lspconfig',
		'williamboman/nvim-lsp-installer',
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

   use {
	   "lewis6991/gitsigns.nvim",
	   after = "plenary.nvim",
	   config = function()
		   require "plugins.gitsigns"
	   end,
   }

   use {
	   "sbdchd/neoformat",
	   cmd = "Neoformat",
	   setup = function()
		   require("mappings").neoformat()
	   end,
   }

   use {
	   "lukas-reineke/indent-blankline.nvim",
	   event = "BufRead",
	   config = function()
		   require "plugins.blankline"
	   end,
   }

   --use {
   --    "glepnir/galaxyline.nvim",
   --    after = "nvim-web-devicons",
   --    config = function()
   -- 	   require "plugins.statusline"
   --    end,
   --}

   use {
	   "kyazdani42/nvim-web-devicons",
	   config = function()
		   require "plugins.icons"
	   end,
   }

   use {
	   "glepnir/lspsaga.nvim",
	   after = "nvim-lspconfig",
	   cmd = {"Lspsaga", "open_floaterm", "close_floaterm"}
   }

   use {
	   'famiu/feline.nvim',
	   requires = {"kyazdani42/nvim-web-devicons", opt = true},
	   config = function()
		   require "plugins.feline"
	   end,
   }

--   use {
--	   "hoob3rt/lualine.nvim",
--	   requires = {"kyazdani42/nvim-web-devicons", opt = true},
--	   config = function()
--		   require "plugins.lualine"
--	   end,
--   }


end)
