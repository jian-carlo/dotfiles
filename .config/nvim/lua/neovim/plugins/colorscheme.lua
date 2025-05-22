return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		vim.cmd("highlight Normal guibg=none")
	end,
}
