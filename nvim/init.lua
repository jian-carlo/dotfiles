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
vim.keymap.set("n", "z.", function() utils.fold_forward() end)
vim.keymap.set("n", "z,", function() utils.fold_backward() end)

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
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
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
vim.keymap.set("n", "<leader>d", "<cmd>cd %:p:h<cr>")
vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
utils.netrw_shortcuts()
vim.keymap.set("n", "<leader>0", "<cmd>e ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader>8", "<cmd>e /mnt/c/Users/JC/Main<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Ex ~<cr>")
utils.help_shortcuts()

-- backup
vim.o.backup = false
vim.o.shada = nil
vim.o.undofile = true
vim.o.swapfile = false

-- plugin manager
vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/gaoDean/autolist.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
})

-- mini pick
require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep_live<cr>")

-- lsp
vim.lsp.enable("tinymist")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.config("tinymist", { cmd = { "tinymist-linux-x64" } })
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")
utils.lsp_keybinds()

-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "bash", "diff", "lua", "markdown", "markdown_inline", "python", "vim", "typst", "query", "latex" },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "markdown" },
    },
})

-- colorscheme
require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- autolist
require("autolist").setup()
vim.api.nvim_create_autocmd("fileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("i", "<cr>", "<cr><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
        vim.keymap.set({ "n", "i" }, "<c-x>", "<cmd>AutolistToggleCheckbox<cr>")
    end,
})

-- typst-preview
vim.keymap.set("n", "<localleader>p", "<cmd>TypstPreview<cr>")
require("typst-preview").setup({ open_cmd = "thorium.exe %s" })

-- todo
local todo = require("todo")
todo.setup()
vim.keymap.set("n", "<leader>t", function() todo.open_float() end)

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
