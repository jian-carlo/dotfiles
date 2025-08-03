local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s(
        {
            trig = "([^%a]?)img",
            snippetType = "snippet",
            condition = nil,
            regTrig = true,
            wordTrig = false,
        },
        fmta(
            [[
        <>![<>](<>)<>
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1] or ""
                end),
                i(1, "cap"),
                i(2, "link"),
                i(3),
            }
        )
    ),
    s(
        {
            trig = "([^%a]?)link",
            snippetType = "autosnippet",
            condition = nil,
            regTrig = true,
            wordTrig = false,
        },
        fmta(
            [[
        <>[<>][<>]<>
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1]
                end),
                i(1, "cap"),
                i(2, "link"),
                i(3),
            }
        )
    ),
    s(
        {
            trig = "```",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
          ```<>
          <>
          ```
        ]],
            {
                i(1),
                i(2),
            }
        )
    ),
}
