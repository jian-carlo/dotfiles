local utils = require("jian.utils")

-- visuals
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 3
vim.o.wrap = false
vim.o.pumheight = 5
vim.o.cursorline = true
vim.keymap.set("n", "<esc>", "<cmd>nohl<cr>")
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
utils.highlight_on_yank()
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.foldminlines = 0
vim.o.foldtext = ""
vim.o.foldlevel = 3
vim.o.foldenable = true
vim.g.markdown_folding = 1

-- editing
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.clipboard = "win32yank"
vim.keymap.set({ "v", "n", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "v", "n", "x" }, "<leader>d", '"+d')
vim.keymap.set({ "v", "n", "x" }, "<leader>p", '"+p')
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>update<cr><cmd>source<cr>")
vim.keymap.set("n", "<leader>J", utils.join_current_paragraph)

-- navigating
vim.o.scrolloff = 10
vim.o.sidescrolloff = 1
vim.o.incsearch = true
vim.o.smartcase = false
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<a-s-p>", "<cmd>bp<cr>")
vim.keymap.set("n", "<a-s-n>", "<cmd>bn<cr>")
vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
utils.netrw_shortcuts()
utils.close_with_q()
vim.keymap.set("n", "<leader>0", "<cmd>e ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader>9", "<cmd>Ex ~/.local/share/nvim/site/pack/core/opt/<cr>")

-- backup
vim.o.backup = false
vim.o.shada = nil
vim.o.undofile = true
vim.o.swapfile = false

-- plugin manager
vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("mason").setup()

-- mini pick
require("mini.pick").setup()
vim.keymap.set("n", "<a-f>", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<a-h>", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<a-b>", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<a-g>", "<cmd>Pick grep_live<cr>")

-- lsp
vim.lsp.enable({"tinymist", "lua_ls", "clangd", "pyright"})
vim.cmd("set completeopt+=noselect")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "bash", "diff", "lua", "markdown", "markdown_inline", "python", "vim", "typst", "query" },
    highlight = { enable = true },
    indent = { enable = true, disable = { "markdown" },
    },
})

-- luasnip
local ls = require("luasnip")
ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
})
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
vim.keymap.set({ "i" }, "<C-l>", function() ls.expand() end)
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end)
vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(-1) end)
vim.keymap.set({ "i", "s" }, "<C-c>", function() if ls.choice_active() then ls.change_choice(1) end end)

-- colors
local bgcolo = "#1e1e1e"
local bgbgcolo = "#1e1e1e"
vim.api.nvim_set_hl(0, "StatusLine", {bg=bgbgcolo})
vim.api.nvim_set_hl(0, "Normal", {bg=bgcolo})
vim.api.nvim_set_hl(0, "NormalNC", {bg=bgcolo})
vim.api.nvim_set_hl(0, "NormalFloat", {bg=bgcolo})
vim.api.nvim_set_hl(0, "FloatBorder", {bg=bgcolo})
