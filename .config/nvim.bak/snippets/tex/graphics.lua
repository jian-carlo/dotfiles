local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

	s(
		{ trig = "fig", snippetType = "snippet", condition = line_begin },
		fmta(
			[[
    \begin{figure}[h!]
      \centering
      <>
      \caption{<>}
      \label{fig:<>}
    \end{figure}
    ]],
			{
				c(1, {
					fmta(
						[[
          \includegraphics[<>]{<>}
          ]],
						{
							i(1, "opts"),
							i(2, "path"),
						}
					),
					fmta(
						[[
          \scalebox{<>}{\input{<>}}
          ]],
						{
							i(1, "scalar"),
							i(2, "path"),
						}
					),
				}),
				i(2, "caption"),
				i(3, "label"),
			}
		)
	),
}
