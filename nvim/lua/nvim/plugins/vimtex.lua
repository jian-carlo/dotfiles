return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_fold_enabled = 1
		vim.g.vimtex_quickfix_open_on_warning = 1
		vim.g.vimtex_log_verbose = 1
		-- vim.g.vimtex_debug = 1
		-- vim.g.vimtex_compiler = {
		--   "build_dir=build",
		-- }
	end,
}
