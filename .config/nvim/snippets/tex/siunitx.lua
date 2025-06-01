-- stylua: ignore start

local function in_unit()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local pattern = "\\unit{.-}"
	for start_pos, end_pos in line:gmatch("()\\unit{.-}()") do
		start_pos = start_pos - 1
		end_pos = end_pos - 1
		if col >= start_pos + 6 and col <= end_pos - 1 then
			return true
		end
	end
	return false
end

local function math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

return {

	s(
		{ trig = "pu", snippetType = "autosnippet", regTrig = true, wordTrig = false, condition = math, priority = 100 },
		fmta(
			[[
    <>\unit{<>}
    ]],
			{
				f(function(_, snip)
					local col = vim.api.nvim_win_get_cursor(0)[2] -- 0-based index
					if col == 0 then
						return "" -- If at the start of the line, return empty string
					end

					local line = vim.api.nvim_get_current_line()
					local prev_char = line:sub(col, col) -- Get the character before cursor

					if prev_char:match("[%a%d})%]]") then
						return "~"
					else
						return ""
					end
				end),
				i(1),
			}
		)
	),

	s(
		{ trig = "([%d])pu", snippetType = "autosnippet", regTrig = true, wordTrig = false, priority = 99 },
		fmta(
			[[
    <>~\unit{<>}
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),

	-- UNIT SPECIFICATION
	s({ trig = "per", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\per")),
	s({ trig = "sr", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\squared")),
	s({ trig = "cb", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\cubed")),
	s({ trig = "^", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, fmta("\\tothe{<>}<>", { i(1), i(2) })),
	s({ trig = "e3", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\kilo")),
	s({ trig = "e-2", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\centi")),
	s({ trig = "e-3", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\milli")),
	s({ trig = "e+6", snippetType = "autosnippet", condition = in_unit }, t("\\mega")),

	-- LENGTH
	s({ trig = "mt", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\meter")),
	s({ trig = "in", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\inch")), -- \DeclareSIUnit\inch{in.}
	s({ trig = "ft", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\feet")), -- \DeclareSIUnit\feet{ft}

	-- TIME
	s({ trig = "sec", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\second")),
	s({ trig = "min", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\minute")),
	s({ trig = "hr", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\hour")),
	s({ trig = "yr", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\year")),

	-- ENERGY
	s({ trig = "J", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\joule")),
	s({ trig = "btu", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\btu")), -- \DeclareSIUnit\btu{Btu}

	-- AMOUNT OF SUBSTANCE
	s({ trig = "mol", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\mole")),

	-- MASS
	s({ trig = "g", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\gram")),
	s({ trig = "lb", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\poundmass")), -- \DeclareSIUnit\poundmass{lb_m}

	-- FORCE
	s({ trig = "N", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\newton")),
	s({ trig = "lbf", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\poundforce")), -- \DeclareSIUnit\poundforce{lb_f}

	-- PRESSURE
	s({ trig = "Pa", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\pascal")),
	s({ trig = "atm", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\atmosphere")), -- \DeclareSIUnit\atmosphere{atm}
	s({ trig = "bar", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\bar")), -- \DeclareSIUnit\bar{bar}
	s({ trig = "psi", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\psi")), -- \DeclareSIUnit\psi{psi}

	-- POWER
	s({ trig = "W", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\watt")),
	s({ trig = "hp", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\horsepower")), -- \DeclareSIUnit\horsepower{hp}

	-- POTENTIAL
	s({ trig = "V", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\volt")),

	-- VOLUME
	s({ trig = "L", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\liter")),
	s({ trig = "ugal", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\usgallons")), -- \DeclareSIUnit\gallons{us gal}
	s({ trig = "igal", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\impgallons")), -- \DeclareSIUnit\impgallons{imp gal}

	-- CHARGE
	s({ trig = "cou", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\coulomb")),

	-- CURRENT
	s({ trig = "A", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\ampere")),

	-- TEMPERATURE
	s({ trig = "K", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\kelvin")),
	s({ trig = "dC", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\degreeCelsius")),
	s({ trig = "R", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\rankine")),
	s({ trig = "dF", snippetType = "autosnippet", condition = in_unit, wordTrig = false }, t("\\degreeFahrenheit")),
}

-- stylua: ignore end
