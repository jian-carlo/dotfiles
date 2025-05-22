return {
	"folke/snacks.nvim",
	opts = {
		statuscolumn = {
			left = { "sign", "git" },
			right = { "fold" },
		},
	},

	event = "BufRead",
	enabled = not vim.g.vscode,
}
