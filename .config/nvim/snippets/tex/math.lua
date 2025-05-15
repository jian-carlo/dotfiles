local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local function math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

return {

	-- FRACTION
	s(
		{ trig = "ff", snippetType = "autosnippet", condition = math, wordTrig = false },
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

	-- MULTIPLY CROSS
	s(
		{ trig = "xx", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
    \times
    ]],
			{
				-- nodes
			}
		)
	),

	-- MULTIPLY DOT
	s(
		{ trig = "**", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
    \cdot
    ]],
			{
				-- nodes
			}
		)
	),

	-- INLINE MATH
	s(
		{ trig = "mk", snippetType = "autosnippet", wordTrig = true },
		fmta(
			[[
    $<>$<>
    ]],
			{
				d(1, get_visual),
				i(0),
			}
		)
	),

	-- ARROW
	s(
		{ trig = "->", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
    \to
    ]],
			{
				-- nodes
			}
		)
	),

	-- DOT
	postfix({ trig = "dot", snippetType = "autosnippet", condition = math, wordTrig = false }, {
		f(function(_, parent)
			return "\\dot{" .. parent.snippet.env.POSTFIX_MATCH .. "}"
		end, {}),
	}),

	-- HAT
	postfix({ trig = "hat", snippetType = "autosnippet", condition = math, wordTrig = false }, {
		f(function(_, parent)
			return "\\hat{" .. parent.snippet.env.POSTFIX_MATCH .. "}"
		end, {}),
	}),

	-- BOXED
	s(
		{ trig = "box", snippetType = "autosnippet", condition = math, wordTrig = false, priority = 1 },
		fmta(
			[[
    \<>{<>}
    ]],
			{
				c(1, { t("boxed"), t("Aboxed") }),
				d(2, get_visual),
			}
		)
	),

	s(
		{ trig = "__", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
    _{<>}
    ]],
			{
				i(1),
			}
		)
	),

	s(
		{ trig = "^^", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
    ^{<>}
    ]],
			{
				i(1),
			}
		)
	),

	s(
		{ trig = "sum", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
        \sum_{<>}^{<>}
        ]],
			{
				i(1),
				i(2),
			}
		)
	),

	s(
		{ trig = "chm", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
      \ce{<>}
      ]],
			{
				i(1),
			}
		)
	),

	-- s(
	-- 	{ trig = "mbox", snippetType = "snippet", condition = nil, wordTrig = false, priority = 2 },
	-- 	fmta(
	-- 		[[
	--      \begin{empheq}[box=\widefbox]{gather*}
	--        <>
	--      \end{empheq}
	--      ]],
	-- 		{
	-- 			d(1, get_visual),
	-- 		}
	-- 	)
	-- ),

	s(
		{ trig = "par", snippetType = "autosnippet", condition = math, wordTrig = false },
		fmta(
			[[
        \frac{\partial <>}{\partial <>}
        ]],
			{
				i(1),
				i(2),
			}
		)
	),

	s(
		{ trig = "int", snippetType = "autosnippet", condition = math, wordTrig = false, priority = 1 },
		fmta(
			[[
        \int <> \, d<>
        ]],
			{
				i(1),
				i(2),
			}
		)
	),

	s(
		{ trig = "dint", snippetType = "autosnippet", condition = math, wordTrig = false, priority = 2 },
		fmta(
			[[
      \int_{<>}^{<>} <> \, d<>
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
			}
		)
	),
}
