local ts_utils = require("nvim-treesitter.ts_utils")

local function math()
	local node = ts_utils.get_node_at_cursor()
	while node do
		local type = node:type()
		if type == "math_environment" or type == "inline_formula" or type == "displayed_equation" then
			return true
		end
		node = node:parent()
	end
	return false
end

-- Generating functions for Matrix/Cases - thanks L3MON4D3!
local generate_matrix = function(args, snip)
    local rows = tonumber(snip.captures[2])
    local cols = tonumber(snip.captures[3])
    local nodes = {}
    local ins_indx = 1
    for j = 1, rows do
        table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
        ins_indx = ins_indx + 1
        for k = 2, cols do
            table.insert(nodes, t(" & "))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
            ins_indx = ins_indx + 1
        end
        table.insert(nodes, t({ "\\\\", "" }))
    end
    -- fix last node.
    nodes[#nodes] = t("\\\\")
    return sn(nil, nodes)
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
            trig = "([^%a]?)mk",
            snippetType = "autosnippet",
            condition = nil,
            regTrig = true,
            wordTrig = false,
        },
        fmta(
            [[
        <>$<>$<>
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1]
                end),
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
        <>\frac{<>}{<>}<>
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1]
                end),
                i(1, "num"),
                i(2, "den"),
                i(0),
            }
        )
    ),
    s(
        {
            trig = "beg",
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
            trig = "([^%a])xx",
            snippetType = "autosnippet",
            condition = math,
            wordTrig = false,
            regTrig = true,
        },
        fmta(
            [[
        <>\times
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1]
                end),
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
        <>\int_{<>}^{<>} <> \, d<>
      ]],
            {
                f(function(_, snip)
                    return snip.captures[1]
                end),
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
    -- postfix({
    -- 	trig = "dot",
    -- 	match_pattern = [[[\\%w%.%_%-%"%']+$]],
    -- 	snippetType = "autosnippet",
    -- 	dscr = "postfix vec when in math mode",
    -- }, { l("\\dot{" .. l.POSTFIX_MATCH .. "}") }, { condition = math }),
    s(
        {
            trig = "__",
            snippetType = "autosnippet",
            condition = math,
            wordTrig = false,
        },
        fmta(
            [[
        <>_{<>}<>
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
            trig = "^^",
            snippetType = "autosnippet",
            condition = math,
            wordTrig = false,
        },
        fmta(
            [[
        <>^{<>}<>
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
            trig = "sum",
            snippetType = "autosnippet",
            condition = math,
            wordTrig = true,
        },
        fmta(
            [[
        \sum_{<>}^{<>} <>
      ]],
            {
                i(1),
                i(2),
                i(3),
            }
        )
    ),
    s(
        {
            trig = "([bBpvV])mat(%d+)x(%d+)([ar])",
            name = "[bBpvV]matrix",
            dscr = "matrices",
            regTrig = true,
            hidden = true,
            condition = math,
            snippetType = "autosnippet",
        },
        fmta(
            [[
    \begin{<>}<>
    <>
    \end{<>}]],
            {
                f(function(_, snip)
                    return snip.captures[1] .. "matrix"
                end),
                f(function(_, snip)
                    if snip.captures[4] == "a" then
                        out = string.rep("c", tonumber(snip.captures[3]) - 1)
                        return "[" .. out .. "|c]"
                    end
                    return ""
                end),
                d(1, generate_matrix),
                f(function(_, snip)
                    return snip.captures[1] .. "matrix"
                end),
            }
        )
    ),
}
