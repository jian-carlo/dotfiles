local o = vim.opt
o.ignorecase = true -- Ignore case on search patterns.
o.inccommand = "nosplit" -- Show live preview of substitution.
o.path:append("**") -- Enable searching for files on subdirectories.
o.smartcase = true -- Use case-sensitive if keyword contains capital letters.
o.startofline = true -- Move cursor to the first non-blank character.
o.whichwrap = "b,s,<,>,[,]" -- Move cursor left/right to move to previous/next lines
o.cmdheight = 1 -- Show command line on 1 line.
o.fillchars = {
	fold = " ", -- Filling foldtext.
	foldsep = " ", -- Open fold middle marker
	eob = " ",
}
o.lazyredraw = true -- Don't redraw when executing macros.
o.number = true -- Show line numbers.
o.numberwidth = 5 -- More space on the gutter column.
o.relativenumber = true -- Show relative line numbers.
o.scrolloff = 10 -- Number of lines to keep above/below the cursor.
o.sidescrolloff = 10 -- Number of columns to keep left/right of the cursor.
o.wrap = false -- Do not automatically wrap texts.
o.cursorline = false -- Highlight current line.
o.termguicolors = true -- Enable true colors.
o.laststatus = 0 -- Don't show statusline
o.splitbelow = true -- Open a new horizontal split below.
o.splitright = true -- Open a new vertical split to the right.
o.showtabline = 0 -- Never show tabline
o.title = false -- Show info in the window title
o.titlelen = 1 -- No limit on title length
o.titlestring = "" -- Show relative path in terminal title
o.mouse = "" -- Don't enable mouse
o.belloff = "all" -- Do not ring the bell for any event.
o.report = 9999 -- Don't report number of changed lines.
o.ruler = false -- Do not show the line and column number of the cursor position.
o.shortmess:append({ -- Don't show messages:
	A = true, -- When a swap file is found.
	C = true, -- When scanning for ins-completion items.
	F = true, -- File info when editing a file.
	I = true, -- Skip intro message.
	S = true, -- Search messages, using nvim-hlslens instead.
	W = true, -- When writing a file.
	a = true, -- Use abbreviations
	c = true, -- 'ins-completion-menu' messages.
	s = true, -- Search hit BOTTOM/TOP messages.
})
o.showcmd = false -- Do not show command on last line.
o.showmode = false -- Do not show mode on last line.
o.complete = ".,]" -- How keyword completion works.
o.completeopt = "menu,menuone,noinsert,preview" -- Disable native autocompletion (using nvim-cmp).
o.pumblend = 5 -- Opaque completion menu background.
o.pumheight = 5 -- Maximum height of popup menu.
o.showmatch = false -- Do not jump to matching brackets.
o.undofile = true -- Automatically save and restore undo history.
o.expandtab = true -- In insert mode, use the correct number of spaces to insert a tab.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.smartindent = true -- Smart indent.
o.softtabstop = 2 -- Number of spaces that a <Tab> key in the file counts for.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.foldenable = true -- Enable folding.
o.foldlevelstart = 99 -- Start with all folds closed.
o.timeout = true -- Wait for mapped key sequence to be received
o.timeoutlen = 300 -- Don't wait 1 second for a possible new key
o.autoread = true -- Automatically reload files changed outside of Vim.
o.backup = false -- Do not create backup files.
o.swapfile = false -- Stop creating swp files.
o.conceallevel = 0 -- Text is shown normally.
o.signcolumn = "yes" -- Always showed to prevent the screen from jumping.
o.viewoptions = "cursor,folds" -- Save cursor position and folds.

vim.cmd([[let g:markdown_syntax_conceal = 0]])
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.cmd("set conceallevel=2")
	end,
})
