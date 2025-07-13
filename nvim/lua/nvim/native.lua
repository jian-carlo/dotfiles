local o = vim.opt
local g = vim.g
local k = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- {{{ options
o.backup = false
o.belloff = "all"
o.colorcolumn = "79"
o.completeopt = "menu,menuone,noinsert,preview"
o.conceallevel = 0
-- o.confirm = true
o.cursorline = true
o.expandtab = true
o.fillchars = {
	fold = " ",
	foldsep = " ",
}
o.foldenable = true
o.foldlevel = 99
o.foldmarker = "{{{,}}}"
o.foldmethod = "marker"
o.foldminlines = 0
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.laststatus = 3
g.markdown_folding = 1
g.messageopt = "wait:200,history:500"
o.mouse = ""
g.netrw_keepdir = 1
g.netrw_banner = 0
g.netrw_liststyle = 0
g.netrw_list_hide = 4
o.number = true
o.path:append("**")
o.pumblend = 0
o.pumheight = 5
o.relativenumber = true
o.ruler = false
-- o.scroll = 25
o.scrolloff = 10
o.shada = nil
o.shiftwidth = 2
o.showcmd = false
o.showtabline = 0
o.sidescrolloff = 0
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.smarttab = false
o.smoothscroll = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = false
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.timeout = true
o.timeoutlen = 300
o.undofile = true
o.viewoptions = "cursor,folds"
o.winborder = "rounded"
o.wrap = false
-- }}}

-- {{{ keymaps
g.mapleader = " "
g.maplocalleader = "\\"
k("n", "<leader>f", "<cmd>Ex<CR>", opts("open netrw"))

k({ "n", "v" }, "<leader>y", [["+y]], opts("yank in + register"))
k({ "n", "v" }, "<leader>p", [["+p]], opts("put in + register"))

k("n", "J", "mzJ`z", opts("keep cursor position when joining"))
k("n", "<c-d>", "<c-d>zz", opts("center when scrolling"))
k("n", "<c-u>", "<c-u>zz", opts("center when scrolling"))
k("n", "n", "nzzzv", opts("center when navigating search"))
k("n", "N", "Nzzzv", opts("center when navigating search"))

k("v", "J", ":m '>+1<cr>gv=gv", opts("drag lines"))
k("v", "K", ":m '<-2<cr>gv=gv", opts("drag lines"))

k("v", ">", ">gv", opts("keep selection when visual indenting"))
k("v", "<", "<gv", opts("keep selection when visual indenting"))

k("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

k("n", "<esc>", "<cmd>nohl<cr>", opts("erase search highlights"))

k("n", "<leader>9", "<cmd>Ex $XDG_CONFIG_HOME/nvim/snippets<CR>", opts("open snippets directory"))
k("n", "<leader>0", "<cmd>Ex $XDG_CONFIG_HOME/nvim<CR>", opts("open config directory"))
k("n", "<leader>8", "<cmd>Ex $HOME/.local/share/nvim<CR>", opts("open data directory"))

k("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		return vim.diagnostic.enable(false, {})
	else
		return vim.diagnostic.enable()
	end
end, opts("toggle diagnostics"))

k("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, opts("copy current file's path"))

k("i", "<c-h>", "<bs>", opts("map <c-h> to <bs> in insert mode"))

k("n", "<leader>`", function()
	local netrw_win = nil

	-- Check if any window is showing Netrw
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "netrw" then
			netrw_win = win
			break
		end
	end

	if netrw_win then
		-- Close the Netrw window, silently handle errors
		pcall(vim.api.nvim_win_close, netrw_win, false)
	else
		-- Open Netrw in a split and resize it, silently handle errors
		pcall(function()
			vim.cmd("S! | vertical resize 50 | wincmd p")
		end)
	end
end, opts("toggle center current buffer"))

k("n", "<leader>it", function()
	if vim.o.background == "dark" then
		vim.cmd("set bg=light")
		vim.cmd("hi Normal guibg=#ebdbb2")
		vim.cmd("hi ColorColumn guibg=#d5c4a1")
	elseif vim.o.background == "light" then
		vim.cmd("set bg=dark")
	end
end, opts("invert theme"))
-- }}}

-- {{{ autocommands
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local function open_thunar()
	local cwd = vim.fn.expand("%:p:h")
	vim.fn.system("thunar " .. cwd)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		local bind = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true, desc = desc })
		end

		bind("o", open_thunar, "open thunar in netrw")
		bind("l", "<CR>", "goto file or directory in netrw")
		bind("h", "-", "up one directory in netrw")
	end,
})

-- }}}
