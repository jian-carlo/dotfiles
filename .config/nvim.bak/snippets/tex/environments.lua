local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

	s(
		{ trig = "h1", snippetType = "snippet", condition = line_begin },
		fmta(
			[[
            \section*{<>}
              \addcontentsline{toc}{section}{<>}
            ]],
			{
				i(1),
				rep(1),
			}
		)
	),

	s(
		{ trig = "h2", snippetType = "snippet", condition = line_begin },
		fmta(
			[[
            \subsection*{<>}
              \addcontentsline{toc}{subsection}{<>}
            ]],
			{
				i(1),
				rep(1),
			}
		)
	),

	s(
		{ trig = "beg", snippetType = "snippet", wordTrig = true, condition = line_begin },
		fmta(
			[[
            \begin{<>}
              <>
            \end{<>}
            ]],
			{
				i(1),
				d(2, get_visual),
				rep(1),
			}
		)
	),

	s(
		{ trig = "al", snippetType = "snippet", condition = line_begin },
		fmta(
			[[
            \begin{aligned*}
              <>
            end{aligned*}
            ]],
			{
				d(1, get_visual),
			}
		)
	),

	s(
		{ trig = "abcls", snippetType = "autosnippet", condition = line_begin },
		fmta(
			[[
            \begin{enumerate}[label=(\alph*)]
              <>
            \end{enumerate}
            ]],
			{
				d(1, get_visual),
			}
		)
	),
}
