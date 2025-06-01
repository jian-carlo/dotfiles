return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.g.vimtex_fold_enabled = 1
		vim.g.vimtex_quickfix_open_on_warning = 1
		vim.g.vimtex_log_verbose = 1
		-- vim.g.vimtex_debug = 1
		-- vim.g.vimtex_compiler = {
		--   "build_dir=build",
		-- }
		vim.cmd([[
      set foldmethod=expr
      set foldexpr=vimtex#fold#level(v:lnum)
      set foldtext=vimtex#fold#text()
    ]])
	end,
}
