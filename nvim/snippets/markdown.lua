local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

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
      snippetType = "snippet",
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
      snippetType = "snippet",
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
      snippetType = "snippet",
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
      snippetType = "snippet",
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
  s(
    {
      trig = "b",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        **<>**
      ]],
      {
        d(1, get_visual)
      }
    )
  ),
  s(
    {
      trig = "i",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        *<>*
      ]],
      {
        d(1, get_visual)
      }
    )
  ),
  s(
    {
      trig = "ln",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        [<>](<>)
      ]],
      {
        i(1, "text"),
        rep(1, "file"),
      }
    )
  ),
  s(
    {
      trig = "```",
      snippetType = "autosnippet",
      condition = nil,
    },
    fmta(
      [[
        ```<>
        ```
      ]],
      {
        i(1, "lang")
      }
    )
  ),
}
-- stylua: ignore end
