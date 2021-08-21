local autopairs_present, autopairs = pcall(require, "nvim-autopairs")
local completion_present, autopairs_completion = pcall(require, "nvim-autopairs.completion.compe")

if not (autopairs_present and completion_present) then
	return
end

autopairs.setup()
autopairs_completion.setup {
   map_cr = true,
   map_complete = true, -- insert () func completion
}
