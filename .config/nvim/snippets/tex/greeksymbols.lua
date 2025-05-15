-- DEPENDENCIES: textgreek

local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

local function greek_letter_snippet(letter)
	return f(function()
		if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
			return "\\" .. letter
		else
			return "\\text" .. letter
		end
	end)
end

return {
	s({ trig = "@a", name = "alpha", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("alpha")),
	s({ trig = "@b", name = "beta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("beta")),
	s({ trig = "@g", name = "gamma", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("gamma")),
	s({ trig = "@d", name = "delta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("delta")),
	s(
		{ trig = "@e", name = "epsilon", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("epsilon")
	),
	s({ trig = "@z", name = "zeta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("zeta")),
	s(
		{ trig = "\\epsilont", name = "eta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("eta")
	),
	s(
		{ trig = "\\textepsilont", name = "eta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("eta")
	),
	s(
		{ trig = "\\tauh", name = "theta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("theta")
	),
	s(
		{ trig = "\\texttauh", name = "theta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("theta")
	),
	s({ trig = "@i", name = "iota", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("iota")),
	s({ trig = "@k", name = "kappa", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("kappa")),
	s({ trig = "@l", name = "lambda", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("lambda")),
	s({ trig = "@m", name = "mu", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("mu")),
	s({ trig = "@n", name = "nu", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("nu")),
	s({ trig = "@x", name = "xi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("xi")),
	s(
		{ trig = "@o", name = "omicron", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("omicron")
	),
	s({ trig = "@p", name = "pi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("pi")),
	s({ trig = "@r", name = "rho", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("rho")),
	s({ trig = "@s", name = "sigma", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("sigma")),
	s({ trig = "@t", name = "tau", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("tau")),
	s({ trig = "\\pih", name = "phi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("phi")),
	s({ trig = "\\textpih", name = "phi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("phi")),
	s({ trig = "@c", name = "chi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("chi")),
	s({ trig = "\\pis", name = "psi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("psi")),
	s({ trig = "\\textpis", name = "psi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("psi")),
	s(
		{ trig = "\\omicronm", name = "omega", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("omega")
	),
	s(
		{ trig = "\\textomicronm", name = "omega", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("omega")
	),

	s({ trig = "@A", name = "Alpha", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Alpha")),
	s({ trig = "@B", name = "Beta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Beta")),
	s({ trig = "@G", name = "Gamma", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Gamma")),
	s({ trig = "@D", name = "Delta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Delta")),
	s(
		{ trig = "@E", name = "Epsilon", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Epsilon")
	),
	s({ trig = "@Z", name = "Zeta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Zeta")),
	s({ trig = "\\Etah", name = "Eta", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Eta")),
	s(
		{ trig = "\\textEtah", name = "Eta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Eta")
	),
	s(
		{ trig = "\\Tauh", name = "Theta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Theta")
	),
	s(
		{ trig = "\\textTauh", name = "Theta", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Theta")
	),
	s({ trig = "@I", name = "Iota", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Iota")),
	s({ trig = "@K", name = "Kappa", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Kappa")),
	s({ trig = "@L", name = "Lambda", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Lambda")),
	s({ trig = "@M", name = "Mu", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Mu")),
	s({ trig = "@N", name = "Nu", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Nu")),
	s({ trig = "@X", name = "Xi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Xi")),
	s(
		{ trig = "@O", name = "Omicron", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Omicron")
	),
	s({ trig = "@P", name = "Pi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Pi")),
	s({ trig = "@R", name = "Rho", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Rho")),
	s({ trig = "@S", name = "Sigma", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Sigma")),
	s({ trig = "@T", name = "Tau", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Tau")),
	s({ trig = "\\Pih", name = "Phi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Phi")),
	s({ trig = "\\textPih", name = "Phi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Phi")),
	s({ trig = "@C", name = "Chi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Chi")),
	s({ trig = "\\Pis", name = "Psi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Psi")),
	s({ trig = "\\textPis", name = "Psi", snippetType = "autosnippet", wordTrig = false }, greek_letter_snippet("Psi")),
	s(
		{ trig = "\\Omicronm", name = "Omega", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Omega")
	),
	s(
		{ trig = "\\textOmicronm", name = "Omega", snippetType = "autosnippet", wordTrig = false },
		greek_letter_snippet("Omega")
	),
}
