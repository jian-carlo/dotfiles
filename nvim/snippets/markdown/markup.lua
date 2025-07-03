return {
	s(
		{
			trig = "([^%a])img",
			snippetType = "snippet",
			condition = nil,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        ![<>](<>)<>
      ]],
			{
				i(1, "cap"),
				i(2, "link"),
				i(3),
			}
		)
	),
	s(
		{
			trig = "([^%a])link",
			snippetType = "autosnippet",
			condition = nil,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        [<>][<>]<>
      ]],
			{
				i(1, "cap"),
				i(2, "link"),
				i(3),
			}
		)
	),
}
