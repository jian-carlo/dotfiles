local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- stylua: ignore start
return {
  s(
    {
      trig = "met",
      snippetType = "snippet",
      condition = nil,
      wordTrig = true,
    },
    fmta([[
      ---
      about:
        - <>
      wd: <>
      met: <>
      date: <>
      day: <>
      ---
    ]],
      {
        i(1),
        i(2),
        c(3, { t("true"), t("false") }),
        i(4),
        i(5),
      }
    )
  ),
  s(
    {
      trig = "ff",
      snippetType = "autosnippet",
      condition = nil,
      wordTrig = true
    },
    fmta(
      [[
        \frac{<>}{<>}
      ]],
      {
        i(1, "num"),
        i(2, "den"),
      }
    )
  ),
  s(
    {
      trig = "dm",
      snippetType = "autosnippet",
      condition = line_begin,
      wordTrig = true
    },
    fmta(
      [[
        $$
        <>
        $$
      ]],
      {
        i(1)
      }
    )
  ),
  s(
    {
      trig = "beg",
      snippetType = "autosnippet",
      condition = line_begin,
      wordTrig = true
    },
    fmta(
      [[
        \begin{<>}
        \end{<>}
      ]],
      {
        i(1),
        rep(1)
      }
    )
  ),
  s(
    {
      trig = "mk",
      snippetType = "autosnippet",
      condition = nil,
      wordTrig = true
    },
    fmta(
      [[
        $<>$
      ]],
      {
        i(1)
      }
    )
  ),
}
-- stylua: ignore end
