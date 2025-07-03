local function math()
	-- get the 1-based cursor row,col
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- synstack returns a list of IDs for all syntax groups at row,col
	local syn_ids = vim.fn.synstack(row, col)
	for _, id in ipairs(syn_ids) do
		local name = vim.fn.synIDattr(id, "name")
		if name == "markdownInlineMath" or name == "markdownBlockMath" then
			return true
		end
	end
	return false
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{
			trig = "dm",
			snippetType = "autosnippet",
			condition = line_begin,
		},
		fmta(
			[[
        $$ <> $$<>
      ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{
			trig = "([^%a])mk",
			snippetType = "snippet",
			condition = nil,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        $<>$<>
      ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{
			trig = "([^%a])ff",
			snippetType = "autosnippet",
			condition = math,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        \frac{<>}{<>}<>
      ]],
			{
				i(1, "num"),
				i(2, "den"),
				i(0),
			}
		)
	),
	s(
		{
			trig = "([^%a])beg",
			snippetType = "autosnippet",
			condition = math,
			regTrig = true,
			wordTrig = false,
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
			trig = "**",
			snippetType = "autosnippet",
			condition = math,
		},
		fmta(
			[[
        \cdot
      ]],
			{
				-- nodes
			}
		)
	),
	s(
		{
			trig = "xx",
			snippetType = "autosnippet",
			condition = math,
		},
		fmta(
			[[
        \times
      ]],
			{
				-- nodes
			}
		)
	),
	s(
		{
			trig = "([%d])e",
			snippetType = "autosnippet",
			condition = math,
			wordTrig = false,
			regTrig = true,
		},
		fmta(
			[[
        <>\times 10^{<>}<>
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
				i(0),
			}
		)
	),
	s(
		{
			trig = "([%d}])pu",
			snippetType = "autosnippet",
			condition = math,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        <>~\pu{<>}<>
      ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
				i(0),
			}
		)
	),
	s(
		{
			trig = "([^%a])int",
			snippetType = "autosnippet",
			condition = math,
			regTrig = true,
			wordTrig = false,
		},
		fmta(
			[[
        \int_{<>}^{<>} <> \, d<>
      ]],
			{
				i(1, "0"),
				i(2, "\\infty"),
				i(3),
				i(4, "x"),
			}
		)
	),
	postfix({
		trig = "hat",
		match_pattern = [[[\\%w%.%_%-%"%']+$]],
		snippetType = "autosnippet",
		dscr = "postfix hat when in math mode",
	}, { l("\\hat{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
	postfix({
		trig = "vec",
		match_pattern = [[[\\%w%.%_%-%"%']+$]],
		snippetType = "autosnippet",
		dscr = "postfix vec when in math mode",
	}, { l("\\vec{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
	postfix({
		trig = "dot",
		match_pattern = [[[\\%w%.%_%-%"%']+$]],
		snippetType = "autosnippet",
		dscr = "postfix vec when in math mode",
	}, { l("\\dot{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
}
