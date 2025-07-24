local utils = require("jian.utils")
local d = utils.d
local light_or_dark = utils.light_or_dark
local open_in_explorer = utils.open_in_explorer
local black_and_white = utils.black_and_white

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
o.laststatus = 0
o.colorcolumn = '80'
o.termguicolors = true
o.wrap = false

-- clipboard
g.clipboard = "win32yank"

-- splits
o.splitbelow = true

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
o.sidescrolloff = 10

-- netrw
g.netrw_keepdir = 1 
g.netrw_banner = 0
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local a = function(desc)
      return { buffer = true, remap = true, desc = desc}
    end
    vim.keymap.set("n", "h", "-", a("up one directory"))
    vim.keymap.set("n", "l", "<CR>", a("goto file/dir"))
    vim.keymap.set("n", "o", open_in_explorer, a("open explorer from netrw"))
  end
})

-- shortcuts
k("n", "<leader>f", "<cmd>Explore<cr>", d("open netrw"))
k("n", "<esc>", "<cmd>nohl<cr>", d("remove search highlights"))
k("n", "<leader>i", "<cmd>Inspect<cr>", d("inspect"))
k("n", "<leader><F1>", light_or_dark, d("toggle light or dark bg"))
k("n", "<leader><F2>", black_and_white, d("toggle black and white theme"))

-- bookmarks
k("n", "<leader>0", "<cmd>e ~/.config/nvim/init.lua<cr>", d("open nvim config"))
k("n", "<leader>9", "<cmd>e ~/.bashrc<cr>", d("open shell config"))
k("n", "<leader>8", "<cmd>e /mnt/c/Users/JC/Main<cr>", d("open main windows dir"))
k("n", "<leader>j", "<cmd>Ex ~/journal<cr>", d("open journal dir"))
k("n", "<leader>n", "<cmd>e ~/notes/index.md<cr>", d("open notes index"))
k("n", "<leader>h", "<cmd>Ex ~<cr>", d("open $HOME in netrw"))
k("n", "<leader>t", "<cmd>e ~/todo.txt<cr>", d("open todo.txt"))

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
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:*",
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" or mode == "\22" then vim.opt.virtualedit = "all"     end
    if mode == "i"                  then vim.opt.virtualedit = "block"   end
    if mode == "v" or mode == "V"   then vim.opt.virtualedit = "onemore" end
  end
})

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

-- snippet/s
k("n", "<localleader>1", [[
0i//////////////////////////////////////////////////////////////////////////////<esc>
  ]], d("comment line"))

require("jian.lazy")

-- fzf-lua
local fzf = require('fzf-lua')
k("n", "<a-f>", function() fzf.files({hidden = true}) end, d("fzf files"))
k("n", "<a-n>", function() fzf.files({cwd='~/.config/nvim'}) end, d("fzf files"))
k("n", "<a-s-b>", function() fzf.builtin() end, d("fzf builtin"))
k("n", "<a-h>", function() fzf.helptags() end, d("fzf helptags"))
k("n", "<a-b>", function() fzf.buffers() end, d("fzf helptags"))
k("n", "<a-r>", function() fzf.resume() end, d("fzf resume"))
k("n", "<a-g>", function() fzf.live_grep() end, d("fzf live grep"))
k("n", "<a-o>", function() fzf.oldfiles() end, d("fzf old files"))
k("n", "<a-k>", function() fzf.keymaps() end, d("fzf keymaps"))

-- typst-preview
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function()
    vim.keymap.set("n", "<localleader>p", "<cmd>silent! TypstPreviewToggle<cr>", { silent = true, desc = "typst-preview toggle"})
  end,
})

-- set to wait:0 because typst-preview shows messages every few seconds
-- if no wifi T_T
-- o.messagesopt = { "wait:2000", "history:500" }

--lsp
require("jian.lsp")
require("jian.colors")
