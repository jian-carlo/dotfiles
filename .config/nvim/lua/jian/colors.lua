local rgb = function(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
end

local hl = function(name, value)
    vim.api.nvim_set_hl(0, name, value)
end

hl("TodoTxtDueDate", { fg = "#e8b589" })
hl("TodoTxtDueKeyword", { fg = "#c48282" })
hl("TodoTxtDone", { italic = false, fg = "#606079" })
hl("TodoTxtPriorityA", { fg = "#b58452" })
hl("TodoTxtPriorityB", { fg = "#a26d6d" })
hl("TodoTxtPriorityC", { fg = "#6e94b2" })

hl("StatusLine", { bg = "#141415" })

hl("wikiLinkContent", { fg = "#bb9dbd", underline = true })
hl("wikiLink", { fg = "#bb9dbd" })
hl("wikiLinkDelimiter", { fg = "#454555" })
hl("@markup.link.label.markdown_inline", {})
hl("@markup.link.markdown_inline", {})
-- hl("@markup.link.url.markdown", {fg = "#bb9dbd"})
hl("markdownUrl", { fg = "#c3c3d5" })

vim.keymap.set(
    "n",
    "<leader>i",
    function()
        vim.cmd("Inspect")
    end,
    {
        noremap = true,
        silent = true,
        desc = "inspect"
    }
)
