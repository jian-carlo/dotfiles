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
}
