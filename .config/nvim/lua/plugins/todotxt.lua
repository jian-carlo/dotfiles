return {
    dir = vim.fn.stdpath("config") .. "/lua/todotxt",
    name = "todotxt",
    lazy = false,
    config = function()
        require("todotxt").setup()
        vim.keymap.set("n", "<leader>t", "<cmd>TodoOpenAll<cr>",
            { noremap = true, silent = true, desc = "open all todotxt files" })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "todotxt",
            callback = function()
                vim.keymap.set("n", "q", "<cmd>TodoCloseAll<cr>",
                    { buffer = true, remap = true, silent = true, desc = "close all todotxt buffers" })
            end
        })
    end
}
