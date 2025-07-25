local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local function get_predefined_text()
    local filepath = vim.api.nvim_buf_get_name(0)

    -- Add your file-specific conditions here
    if string.find(filepath, "research.txt") then
        return "r"
    elseif string.find(filepath, "school.txt") then
        return "s"
    elseif string.find(filepath, "hobby.txt") then
        return "h"
    else
        return ""
    end
end

local function get_today_date()
    return os.date("%Y-%m-%d")
end

return {
    s(
        {
            trig = "t",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
      [ ] due:<><> (<>) -<> <>
    ]],
            {
                f(get_today_date),
                i(0),
                c(1, { t("C"), t("B"), t("A") }),
                f(get_predefined_text),
                i(2),
            }
        )
    ),
}
