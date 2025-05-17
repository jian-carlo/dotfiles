return {
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						icon_preset = "diamond",
					},
					["core.esupports.metagen"] = {
						author = "jian",
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								college = "~/personal/notes/college",
								research = "~/personal/notes/research",
							},
							index = "index.norg", -- The name of the main (root) .norg file
						},
					},
					["core.summary"] = {},
					["core.qol.toc"] = {
						close_after_use = true,
					},
				},
			})
			-- vim.api.nvim_create_autocmd("Filetype", {
			--     pattern = "norg",
			--     callback = function()
			--         vim.keymap.set("n", "my-key-here", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
			--     end,
			-- })
		end,
	},
}
