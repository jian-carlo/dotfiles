function Recolor()
    vim.cmd("highlight SignColumn guibg=none")
    vim.cmd("highlight LineNr guibg=none")
    vim.cmd("highlight CursorLine guibg=none")
    vim.cmd("highlight StatusLine guibg=none")
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
end

Recolor()
vim.keymap.set("n", "<leader>cr", function()
    Recolor()
end)
