local rgb = function(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
end

local hl = function(name, value)
    vim.api.nvim_set_hl(0, name, value)
end

hl("TodoTxtDueDate", {fg = "#e8b589"})
hl("TodoTxtDueKeyword", {fg = "#c48282"})
hl("TodoTxtDone", {italic = false, fg = "#606079"})
hl("TodoTxtPriorityA", {fg = "#b58452"})
hl("TodoTxtPriorityB", {fg = "#a26d6d"})
hl("TodoTxtPriorityC", {fg = "#6e94b2"})
