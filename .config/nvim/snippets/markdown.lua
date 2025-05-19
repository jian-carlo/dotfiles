return {
	s(
		{ trig = "met", snippetType = "snippet" },
		fmta(
			[[
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
				i(3),
				i(4),
				i(5),
			}
		)
	),
	s(
		{ trig = "ff", snippetType = "snippet", wordTrig = false },
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
		{ trig = "beg", snippetType = "snippet", wordTrig = false },
		fmta(
			[[
                \begin{<>}
                \end{<>}
            ]],
			{
				i(1),
				r(1),
			}
		)
	),
}
