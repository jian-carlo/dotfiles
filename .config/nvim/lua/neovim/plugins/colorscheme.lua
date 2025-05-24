return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		vim.cmd("highlight Normal guibg=none")
		vim.cmd("highlight NormalFloat guibg=none")
		vim.cmd("highlight NormalNC guibg=none")
		vim.cmd("highlight StatusLine guibg=none")
		vim.cmd("highlight FloatBorder guibg=none")
	end,
}
