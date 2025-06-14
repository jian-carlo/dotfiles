local palette = {
	bright_red = "#fb4934",
	bright_green = "#b8bb26",
	bright_yellow = "#fabd2f",
	bright_blue = "#83a598",
	bright_purple = "#d3869b",
	bright_aqua = "#8ec07c",
	bright_orange = "#fe8019",
}

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				markdownH1 = { fg = palette.bright_blue },
				markdownH2 = { fg = palette.bright_green },
				markdownH3 = { fg = palette.bright_purple },
				markdownH4 = { fg = palette.bright_yellow },
				markdownH5 = { fg = palette.bright_orange },
				markdownH6 = { fg = palette.bright_aqua },
				markdownH1Delimiter = { fg = palette.bright_blue },
				markdownH2Delimiter = { fg = palette.bright_green },
				markdownH3Delimiter = { fg = palette.bright_purple },
				markdownH4Delimiter = { fg = palette.bright_yellow },
				markdownH5Delimiter = { fg = palette.bright_orange },
				markdownH6Delimiter = { fg = palette.bright_aqua },
				["@markup.heading.1.markdown"] = { fg = palette.bright_blue },
				["@markup.heading.2.markdown"] = { fg = palette.bright_green },
				["@markup.heading.3.markdown"] = { fg = palette.bright_purple },
				["@markup.heading.4.markdown"] = { fg = palette.bright_yellow },
				["@markup.heading.5.markdown"] = { fg = palette.bright_orange },
				["@markup.heading.6.markdown"] = { fg = palette.bright_aqua },
			},
			dim_inactive = false,
			transparent_mode = true,
		})
		vim.keymap.set(
			"n",
			"<leader>hi",
			"<cmd>Inspect<cr>",
			{ noremap = true, silent = true, desc = "see highlight/syntax group" }
		)
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
	end,
}
