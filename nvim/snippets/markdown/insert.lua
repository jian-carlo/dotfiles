local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
			trig = "d",
			snippetType = "snippet",
			condition = nil,
		},
		fmta(
			[[
        # <>
      ]],
			{
				f(function()
					return os.date("%Y-%m-%d %A")
				end),
			}
		)
	),
	s(
		{
			trig = "t",
			snippetType = "snippet",
			condition = nil,
		},
		fmta(
			[[
        ## <>
      ]],
			{
				f(function()
					local time = os.time()
					return os.date("%H:%M", time)
				end),
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
				i(1, "lang"),
				i(2),
			}
		)
	),
}
