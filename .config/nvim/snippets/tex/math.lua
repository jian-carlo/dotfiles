local get_visual = function()
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

local function math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

-- stylua: ignore start
return {
	s(
		{
			trig = "ff",
			snippetType = "autosnippet",
			condition = math,
      wordTrig = true,
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
			trig = "^^",
			snippetType = "autosnippet",
			condition = math,
		},
		fmta(
			[[
      ^{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	s(
		{
			trig = "__",
			snippetType = "autosnippet",
			condition = math,
		},
		fmta(
			[[
      _{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
  s(
    {
      trig = "int",
      snippetType = "snippet",
      condition = math,
    },
    fmta(
      [[
      \int_{<>}^{<>} <> \, d<>
      ]],
      {
        i(1, "9"),
        i(2, "x"),
        i(3, "f(x)"),
        i(4, "x")
      }
    )
  ),
  s(
    {
      trig = "par",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        \left(\frac{\partial <>}{\partial <>}\right)_{<>}
      ]],
      {
        i(1, "z"),
        i(2, "x"),
        i(3, "y"),
      }
    )
  ),
  s(
    {
      trig = "mbox",
      snippetType = "autosnippet",
      condition = math,
    },
    fmta(
      [[
        \begin{empheq}[box=\widefbox]{gather*}
          <>
        \end{empheq}
      ]],
      {
        d(1, get_visual)
      }
    )
  ),
  s(
    {
      trig = "mk",
      snippetType = "autosnippet",
      condition = nil,
    },
    fmta(
      [[
        \(<>\)
      ]],
      {
        i(1)
      }
    )
  ),
}
-- stylua: ignore end
