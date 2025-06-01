return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd.colorscheme("rose-pine")
		vim.cmd("highlight Normal guibg=none")
		vim.cmd("highlight NormalNC guibg=none")
		vim.cmd("highlight NormalFloat guibg=none")
		vim.cmd("highlight Float guibg=none")
		vim.cmd("highlight FloatBackground guibg=none")
		vim.cmd("highlight FloatBorder guibg=none")
		vim.cmd("highlight FloatShadow guibg=none")
		vim.cmd("highlight Pmenu guibg=none")
		vim.cmd("highlight PmenuSel guibg=none")
		vim.cmd("highlight PmenuThumb guibg=none")
		vim.cmd("highlight PmenuBar guibg=none")
	end,
}
