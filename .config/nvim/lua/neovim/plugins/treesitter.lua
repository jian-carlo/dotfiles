-- Define a custom highlight group for MarkdownTags
-- You can customize the foreground (fg) and background (bg) colors,
-- as well as other attributes like bold, italic, underline.
vim.api.nvim_set_hl(0, "MarkdownTag", { fg = "#7C3AED", bold = true, italic = true }) -- A purple color

-- Link your custom Treesitter capture group to the highlight group
-- This is often done in your nvim-treesitter setup

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
				custom_captures = {
					["MarkdownTags"] = "MarkdownTag",
				},
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
