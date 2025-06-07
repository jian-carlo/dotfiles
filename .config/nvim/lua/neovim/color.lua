-- Define the syntax pattern for `#tag` in Markdown
vim.cmd([[
  augroup MarkdownTagHighlight
    autocmd!
    autocmd FileType markdown syntax match MarkdownTag /#\w\+/
  augroup END
]])
vim.keymap.set("n", "<leader>vc", function()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local synID = vim.fn.synID(line, col, true)
	local transID = vim.fn.synIDtrans(synID)

	local output = string.format(
		"hi<%s> trans<%s> lo<%s> FG:%s",
		vim.fn.synIDattr(synID, "name"),
		vim.fn.synIDattr(vim.fn.synID(line, col, false), "name"),
		vim.fn.synIDattr(transID, "name"),
		vim.fn.synIDattr(transID, "fg#")
	)

	print(output)
end, { noremap = true, silent = true })

-- Custom highlight groups
local function rosepine()
	local bg = vim.o.background
	if bg == "dark" then
		vim.cmd("highlight texArg guifg=#f6c177")
		vim.cmd("highlight texCmd guifg=#9ccfd8")
		vim.cmd("highlight texMathSymbol guifg=#9ccfd8")
		vim.cmd("highlight texMathArg guifg=#9ccfd8")
		vim.cmd("highlight texMathSub guifg=#9ccfd8")
		vim.cmd("highlight texMathCmd guifg=#c4a7e7")
		vim.cmd("highlight texMathDelim guifg=#31748f")
		vim.cmd("highlight texMathEnvArgName guifg=#eb6f92")
		vim.cmd("highlight texCmdEnv guifg=#eb6f92")
		vim.cmd("highlight texEnvArgName guifg=#eb6f92")
		vim.cmd("highlight texCmdPart guifg=#f6c177")
		vim.cmd("highlight texDelim guifg=#524f67")
		vim.cmd("highlight texMathDelimZoneTD guifg=#eb6f92")
		vim.cmd("highlight texMathDelimZoneTI guifg=#eb6f92")
		vim.cmd("highlight texPartArgTitle guifg=#f6c177")
		vim.cmd("highlight MarkdownTag guifg=#f6c177")

		vim.cmd("highlight Normal guibg=#000000")
		vim.cmd("highlight NormalNC guibg=#000000")
		vim.cmd("highlight NormalFloat guibg=#000000")
		vim.cmd("highlight Float guibg=#000000")
		vim.cmd("highlight FloatBackground guibg=#000000")
		vim.cmd("highlight FloatBorder guibg=#000000")
		vim.cmd("highlight FloatShadow guibg=#000000")
		vim.cmd("highlight Pmenu guibg=#000000")
		vim.cmd("highlight PmenuSel guibg=#000000")
		vim.cmd("highlight PmenuThumb guibg=#000000")
		vim.cmd("highlight PmenuBar guibg=#000000")

		vim.cmd("highlight Comment guifg=#6e6a86 gui='italic'")
		vim.cmd("highlight LineNr guifg=#6e6a86 gui='italic'")
	elseif bg == "light" then
		vim.cmd("highlight texArg guifg=#d28c45")
		vim.cmd("highlight texCmd guifg=#548c94")
		vim.cmd("highlight texMathSymbol guifg=#548c94")
		vim.cmd("highlight texMathArg guifg=#548c94")
		vim.cmd("highlight texMathSub guifg=#548c94")
		vim.cmd("highlight texMathCmd guifg=#9867c5")
		vim.cmd("highlight texMathDelim guifg=#25627b")
		vim.cmd("highlight texMathEnvArgName guifg=#d35470")
		vim.cmd("highlight texCmdEnv guifg=#d35470")
		vim.cmd("highlight texEnvArgName guifg=#d35470")
		vim.cmd("highlight texCmdPart guifg=#d28c45")
		vim.cmd("highlight texDelim guifg=#86848c")
		vim.cmd("highlight texMathDelimZoneTD guifg=#d35470")
		vim.cmd("highlight texMathDelimZoneTI guifg=#d35470")
		vim.cmd("highlight texPartArgTitle guifg=#d28c45")
		vim.cmd("highlight MarkdownTag guifg=#d28c45")

		vim.cmd("highlight Normal guibg=#ffffff")
		vim.cmd("highlight NormalNC guibg=#ffffff")
		vim.cmd("highlight NormalFloat guibg=#ffffff")
		vim.cmd("highlight Float guibg=#ffffff")
		vim.cmd("highlight FloatBackground guibg=#ffffff")
		vim.cmd("highlight FloatBorder guibg=#ffffff")
		vim.cmd("highlight FloatShadow guibg=#ffffff")
		vim.cmd("highlight Pmenu guibg=#ffffff")
		vim.cmd("highlight PmenuSel guibg=#ffffff")
		vim.cmd("highlight PmenuThumb guibg=#ffffff")
		vim.cmd("highlight PmenuBar guibg=#ffffff")

		vim.cmd("highlight Comment guifg=#86848c gui='italic'")
		vim.cmd("highlight LineNr guifg=#86848c gui='italic'")
	end
end

-- Auto-trigger on background change
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = rosepine,
})

-- Call initially to set up highlighting
rosepine()

vim.keymap.set("n", "<leader>ct", function()
	if vim.o.background == "light" then
		vim.o.background = "dark"
	elseif vim.o.background == "dark" then
		vim.o.background = "light"
	end
end, { desc = "Toggle background between dark and light" })

-- Define the syntax pattern for `#tag` in Markdown
vim.cmd([[
  augroup MarkdownTagHighlight
    autocmd!
    autocmd FileType markdown syntax match MarkdownTag /#\w\+/
  augroup END
]])
