local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "lua",
	  "css",
	  "dart",
	  "dockerfile",
	  "bash",
	  "html",
	  "yaml",
	  "typescript",
	  "json",
	  "fish",
	  "go",
	  "c",
	  "cpp",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
