return {
    "https://github.com/chomosuke/typst-preview.nvim",
    lazy = false,
    version = "1.*",
    config = function()
        vim.keymap.set("n", "<localleader>p", "<cmd>silent! TypstPreviewToggle<cr>",
            { silent = true, desc = "typst-preview toggle" })
        require("typst-preview").setup({
            open_cmd = "thorium.exe %s",
        })
    end,
}
