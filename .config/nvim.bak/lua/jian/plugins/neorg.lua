return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {
					config = {
						disable = {
							"core.iter",
						},
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							college = "~/personal/notes/college/",
							research = "~/personal/notes/research/",
						},
						index = "index.norg",
						use_popup = false,
					},
				},
				["core.concealer"] = {},
			},
		})
	end,
}
