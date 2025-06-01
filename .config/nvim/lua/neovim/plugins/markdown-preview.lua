return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.g.mkdp_browser = "firefox"
		vim.g.mkdp_auto_start = 1
		vim.g.mkdp_auto_close = 1
		vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<cr>")
	end,
}
