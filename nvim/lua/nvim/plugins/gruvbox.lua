return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		local palette = require("gruvbox").palette
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
				texCmdPart = { fg = palette.bright_purple, bold = true },
				texPartArgTitle = { fg = palette.bright_purple, bold = true },
				texDelim = { fg = palette.gray },
				texCmdEnv = { fg = palette.bright_orange },
				texEnvArgName = { fg = palette.bright_orange },
				texSpecialChar = { fg = palette.gray },
				texCmdSI = { fg = palette.gray },
				texSICmd = { fg = nil },
				texMathCmd = { fg = palette.bright_blue },
				texMathArg = { fg = palette.bright_blue },
				texCmdMathEnv = { fg = palette.bright_green },
				texMathEnvArgName = { fg = palette.bright_green },
				texMathDelim = { fg = palette.gray },
				texMathOper = { fg = palette.bright_blue },
				texMathSymbol = { fg = palette.bright_blue },
				texMathZoneEnv = { fg = palette.bright_blue },
				texMathGroup = { fg = palette.bright_blue },
				texMathSub = { fg = palette.bright_blue },
				texMathZoneLI = { fg = palette.bright_blue },
				texOptEqual = { fg = palette.bright_blue },
				texMathZoneTI = { fg = palette.bright_blue },
				texCmdEnvM = { fg = palette.bright_green },
				texCmd = { fg = palette.bright_blue },
				texRefArg = { fg = palette.bright_purple },
				texCmdRef = { fg = palette.bright_purple },
				texFileArg = { fg = palette.bright_purple },
				texTabularChar = { fg = palette.gray },
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
