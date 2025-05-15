vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1

local function open_netrw_dir_in_explorer()
    local current_dir = vim.fn.expand("%:p:h")
    vim.fn.system("thunar " .. current_dir)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.keymap.set("n", "o", open_netrw_dir_in_explorer, { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
        end

        bind("a", "%")
        bind("r", "R")
        bind("l", "<CR>")
        bind("h", "-")
    end,
})
