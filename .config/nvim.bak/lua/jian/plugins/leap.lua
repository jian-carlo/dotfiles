return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        vim.keymap.set("n", "f", "<Plug>(leap-anywhere)")
        vim.keymap.set({ "x", "o" }, "f", "<Plug>(leap)")
    end
}
