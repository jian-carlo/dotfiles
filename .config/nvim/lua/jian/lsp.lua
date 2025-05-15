vim.lsp.enable("texlab")
vim.lsp.enable("pyright")

--diagnostics-- diagnostics
vim.keymap.set("n", "<leader>k", function()
    vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
        callback = function()
            vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
            return true
        end,
    })
end, { desc = "toggle virtual line diagnostics" })

-- blink.cmp
local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,                                                                                
        },                                                                                                         
    },                                                                                                             
}                                                                                                                  

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)              
