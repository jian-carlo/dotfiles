local utils = require("jian.utils")
local d = utils.d

local o = vim.opt
local g = vim.g
local k = vim.keymap.set

g.mapleader = ' '
g.maplocalleader = '\\'
_G.black_and_white = 0

-- appearance
o.nu = true
o.rnu = true
o.ruler = false
vim.cmd([[
set laststatus=0
set statusline=%{repeat('─',winwidth('.'))}
]])
o.colorcolumn = '80'
o.termguicolors = true
o.wrap = false
o.pumheight = 5
o.cursorline = true
o.fillchars = { fold = " ", foldsep = " " }

-- search
o.incsearch = true
o.path:append("**")
o.smartcase = false

-- clipboard
g.clipboard = "win32yank"

-- splits
o.splitbelow = true
o.splitright = true
k("n", "<c-h>", "<c-w>h", d("remap the change window focus keys"))
k("n", "<c-j>", "<c-w>j", d("remap the change window focus keys"))
k("n", "<c-k>", "<c-w>k", d("remap the change window focus keys"))
k("n", "<c-l>", "<c-w>l", d("remap the change window focus keys"))

-- indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.softtabstop = 4
o.smarttab = true
o.smartindent = true

-- backup
o.backup = false
o.shada = nil
o.undofile = true
o.swapfile = false

-- scroll
o.scrolloff = 10
o.sidescrolloff = 1

-- netrw
g.netrw_keepdir = 1
g.netrw_banner = 0
utils.netrw_shortcuts()

-- shortcuts
k("n", "<leader>f", "<cmd>Explore<cr>", d("open netrw"))
k("n", "<esc>", "<cmd>nohl<cr>", d("remove search highlights"))
k("n", "<F1>", utils.light_or_dark, d("toggle light or dark bg"))
k("n", "<F2>", utils.black_and_white, d("toggle black and white theme"))
k('n', 'gx', utils.gx_open_in_browser, d("remap gx to open <cWORD> in thorium.exe"))

-- bookmarks
k("n", "<leader>0", "<cmd>e ~/.config/nvim/init.lua<cr>", d("open nvim config"))
k("n", "<leader>9", "<cmd>e ~/.bashrc<cr>", d("open shell config"))
k("n", "<leader>8", "<cmd>e /mnt/c/Users/JC/Main<cr>", d("open main windows dir"))
k("n", "<leader>n", "<cmd>e ~/notes/index.md<cr>", d("open notes index"))
k("n", "<leader>h", "<cmd>Ex ~<cr>", d("open $HOME in netrw"))

-- navigating
k("n", "J", "mzJ`z", d("keep cursor position when joining"))
k("n", "<c-d>", "<c-d>zz", d("center when scrolling"))
k("n", "<c-u>", "<c-u>zz", d("center when scrolling"))
k("n", "n", "nzzzv", d("center when navigating search"))
k("n", "N", "Nzzzv", d("center when navigating search"))
k("n", "<a-s-p>", "<cmd>bp<cr>", d("buffer previous"))
k("n", "<a-s-n>", "<cmd>bn<cr>", d("buffer next"))
k("n", "<a-s-p>", "<cmd>bp<cr>", d("buffer previous"))
k("n", "<a-s-n>", "<cmd>bn<cr>", d("buffer next"))

-- editing
k("v", "J", ":m '>+1<cr>gv=gv", d("drag lines"))
k("v", "K", ":m '<-2<cr>gv=gv", d("drag lines"))
k("v", ">", ">gv", d("keep selection when visual indenting"))
k("v", "<", "<gv", d("keep selection when visual indenting"))
k("i", "<c-h>", "<bs>", d("map <c-h> to <bs> in insert mode"))
k("n", "<leader>J", utils.join_current_paragraph, d("join a paragraph"))
utils.highlight_on_yank()

-- terminal
k("n", "<c-t>a", "<cmd>cd %:p:h | term<cr>A", d("open terminal (whole buffer)"))
k("n", "<c-t>s", "<cmd>S | cd %:p:h | term<cr>A", d("open terminal (horizontal split)"))
k("t", "<c-t>x", "<c-\\><c-n><cmd>bd!<cr>", d("delete terminal session"))
k("t", "<esc><esc>", "<c-\\><c-n>", d("escape terminal mode"))
k("n", "<leader>d", "<cmd>cd %:p:h<cr>", d("cd to current file"))
k("t", "<c-w>h", "<c-\\><c-n><c-w>h", d("navigate from terminal split"))
k("t", "<c-w>j", "<c-\\><c-n><c-w>j", d("navigate from terminal split"))
k("t", "<c-w>k", "<c-\\><c-n><c-w>k", d("navigate from terminal split"))
k("t", "<c-w>l", "<c-\\><c-n><c-w>l", d("navigate from terminal split"))

-- todotxt
require("todotxt").setup()

--lsp
require("jian.lsp")

-- source the plugins
require("jian.lazy")

--syntax highlighting to override colorscheme plugin
require("jian.colors")
