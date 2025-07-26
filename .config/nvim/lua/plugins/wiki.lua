return {
    "https://github.com/lervag/wiki.vim",
    init = function()
        vim.cmd("let g:wiki_root = '~/notes'")
        vim.keymap.set("n", "<localleader>]", "<cmd>WikiLinkNext<cr>", { desc = "navigate links" })
        vim.keymap.set("n", "<localleader>[", "<cmd>WikiLinkPrev<cr>", { desc = "navigate links" })
    end
}
