local packer
local present, _ = pcall(require, "packerInit")

if present then
	print("Packer is here")
	packer = require "packer"
else
	print("Where's Packer..?")
	return false
end

local use = packer.use

return packer.startup(function()
	use 'wbthomason/packer.nvim'

	use "alvan/vim-closetag"

--  	use {
--		'w0rp/ale',
--    		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--    		cmd = 'ALEEnable',
--    		config = 'vim.cmd[[ALEEnable]]',
--	  }
  end)
