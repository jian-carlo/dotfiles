-- typst-preview
vim.keymap.set("n", "<localleader>p", "<cmd>TypstPreview<cr>")
require("typst-preview").setup({ open_cmd = "thorium.exe %s" })
