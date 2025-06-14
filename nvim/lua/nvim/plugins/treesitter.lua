return {
	"nvim-treesitter/nvim-treesitter",
	opts = function()
		return {
			-- auto_install = true, -- Auto-install languages that are not installed
			-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
			ensure_installed = {
				"bash",
				"css",
				"csv",
				"diff",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"powershell",
				"python",
				"vim",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby", "markdown" },
			},
			indent = {
				enable = true,
			},
		}
	end,

	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	-- event = "BufReadPost",
}
