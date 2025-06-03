vim.api.nvim_create_user_command("Recolor", function()
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
	vim.cmd("highlight PmenuExtra guibg=none")
	vim.cmd("highlight PmenuKind guibg=none")
	vim.cmd("highlight PmenuSbar guibg=none")
	vim.cmd("highlight PmenuExtraSel guibg=none")
	vim.cmd("highlight PmenuKindSel guibg=none")
end, {})

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

-- Custom LaTeX Syntax Highlighting with Rose Pine Colors
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
