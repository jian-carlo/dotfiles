local k = vim.keymap.set

-- local concealer = {
-- 	config = {
-- 		folds = true,
-- 		icon_preset = "diamond",
-- 	},
-- }
--
-- local dirman = {
-- 	config = {
-- 		workspaces = {
-- 			notes = "~/personal/neorg/",
-- 		},
-- 		default_workspace = "notes",
-- 	},
-- }

-- local interim_ls = {
-- 	config = {
-- 		completion_provider = {
-- 			enable = true,
-- 			documentation = true,
-- 			categories = false,
-- 		},
-- 	},
-- }

-- local completion = {
-- 	config = {
-- 		engine = {
-- 			module_name = "external.lsp-completion",
-- 		},
-- 	},
-- }

-- local summary = {
-- 	config = {
-- 		strategy = "default",
-- 	},
-- }

--- ====================================================
--- NEORG
--- ====================================================

return {
	"nvim-neorg/neorg",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/personal/neorg/",
						},
						default_workspace = "notes",
					},
				},
				-- ["external.interim-ls"] = interim_ls,
				-- ["core.completion"] = completion,
				-- ["core.export"] = {},
				-- ["core.export.markdown"] = {},
				["core.summary"] = {},
			},
		})
		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
		vim.api.nvim_create_autocmd("Filetype", {
			pattern = "norg",
			callback = function()
				k("n", "<leader>jk", "<Plug>(neorg.itero.next-iteration)", {})
				k("n", "<localleader>nc", ":Neorg toc<CR>")
			end,
		})
	end,
}
