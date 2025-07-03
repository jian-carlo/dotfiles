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

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- stylua: ignore start
return {
  s(
    {
      trig = "met",
      snippetType = "snippet",
      condition = nil,
      wordTrig = true,
    },
    fmta([[
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
        c(3, { t("true"), t("false") }),
        i(4),
        i(5),
      }
    )
  ),
  s(
    {
      trig = "ff",
      snippetType = "autosnippet",
      condition = math,
      wordTrig = true
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
      trig = "dm",
      snippetType = "autosnippet",
      condition = line_begin,
      wordTrig = true
    },
    fmta(
      [[
        $$
        <>
        $$
      ]],
      {
        i(1)
      }
    )
  ),
  s(
    {
      trig = "beg",
      snippetType = "autosnippet",
      condition = math,
      wordTrig = true
    },
    fmta(
      [[
        \begin{<>}
        \end{<>}
      ]],
      {
        i(1),
        rep(1)
      }
    )
  ),
  s(
    {
      trig = "pu",
      snippetType = "autosnippet",
      condition = math,
    },
    fmta(
      [[
        ~\pu{<>}
      ]],
      {
        i(1)
      }
    )
  ),
  s(
    {
      trig = "mk",
      snippetType = "autosnippet",
      condition = nil,
      wordTrig = true
    },
    fmta(
      [[
        $<>$
      ]],
      {
        i(1)
      }
    )
  ),
  s(
    {
      trig = "b",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        **<>**
      ]],
      {
        d(1, get_visual)
      }
    )
  ),
  s(
    {
      trig = "i",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        *<>*
      ]],
      {
        d(1, get_visual)
      }
    )
  ),
  s(
    {
      trig = "ln",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        [<>](<>)
      ]],
      {
        i(1, "text"),
        rep(1, "file"),
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
        ```
      ]],
      {
        i(1, "lang")
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
        f(function ()
          local time = os.time()
          return os.date("%H:%M", time)
        end)
      }
    )
  ),
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
        f(function ()
          return os.date("%Y-%m-%d %A")
        end)
      }
    )
  ),
}
-- stylua: ignore end
