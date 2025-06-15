local o = vim.opt
local g = vim.g
local k = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- {{{ options
o.backup = false
o.belloff = "all"
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
o.foldlevelstart = 99
o.foldlevel = 1
o.foldmarker = "{{{,}}}"
o.foldmethod = "marker"
o.foldminlines = 0
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.laststatus = 3
g.messageopt = "wait:200,history:500"
o.mouse = ""
g.netrw_keepdir = 1
g.netrw_banner = 0
g.netrw_liststyle = 0
g.netrw_list_hide = 0
o.number = true
o.path:append("**")
o.pumblend = 0
o.pumheight = 5
o.relativenumber = true
o.ruler = false
o.scrolloff = 10
o.shada = nil
o.shiftwidth = 2
o.showcmd = false
o.showtabline = 0
o.sidescrolloff = 24
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = false
o.smarttab = true
o.smoothscroll = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
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

k("v", "<leader>y", '"+y', opts("yank in + register"))
k("v", "<leader>p", '"+p', opts("put in + register"))

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

k("n", "<leader>7", "<cmd>Ex $XDG_DATA_HOME/nvim/lazy/<CR>", opts("open data directory"))
k("n", "<leader>8", "<cmd>Ex $XDG_CONFIG_HOME/nvim/snippets<CR>", opts("open snippets directory"))
k("n", "<leader>9", "<cmd>Ex $HOME/personal<CR>", opts("open config directory"))
k("n", "<leader>0", "<cmd>Ex $XDG_CONFIG_HOME/nvim<CR>", opts("open config directory"))

k("i", "<localleader>d", function()
	local date = os.date("%Y-%m-%d %A")
	vim.api.nvim_put({ date }, "c", true, true)
end, opts("date today"))

k("i", "<localleader>t", function()
	local time = os.time()
	local ftime = os.date("%H:%M", time)
	vim.api.nvim_put({ ftime }, "c", true, true)
end, opts("time now"))

k("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		return vim.diagnostic.enable(false, {})
	else
		return vim.diagnostic.enable()
	end
end, opts("toggle diagnostics"))
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		-- bind("o", open_netrw_dir_in_explorer)
		bind("l", "<CR>")
		bind("h", "-")
	end,
})
-- }}}
