local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- stylua: ignore start
return {
	s(
		{
			trig = "beg",
			snippetType = "snippet",
			condition = line_begin,
		},
		fmta(
			[[
        \begin{<>}
        \end{<>}
      ]],
			{
				i(1),
				rep(1),
			}
		)
	),
  s(
    {
      trig = "abcls",
      snippetType = "autosnippet",
      condition = nil,
    },
    fmta(
      [[
        \begin{enumerate}[label=(\alph*)]
          <>
        \end{enumerate}
      ]],
      {
        i(1)
      }
    )
  ),
  s(
    {
      trig = "rf",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        Figure~\ref{fig:<>}
      ]],
      {
        i(1, "id"),
      }
    )
  ),
  s(
    {
      trig = "re",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        Eq.~(\ref{eq:<>})
      ]],
      {
        i(1, "id"),
      }
    )
  ),
}
-- stylua: ignore end
