return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local k = vim.keymap.set
		k("n", "<leader>sf", ":Telescope find_files<CR>")
		k("n", "<leader>sg", ":Telescope live_grep<CR>")
		k("n", "<leader>sb", ":Telescope buffers<CR>")
		k("n", "<leader>sh", ":Telescope help_tags<CR>")
		k("n", "<leader>sr", ":Telescope resume<CR>")
		k("n", "<leader>so", ":Telescope oldfiles<CR>")
		k("n", "<leader>sq", ":Telescope quickfix<CR>")
		k("n", "<leader>sp", ":Telescope builtin<CR>")
		require("telescope").setup({
			pickers = {
				find_files = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = { theme = "dropdown" },
				help_tags = { theme = "dropdown" },
				resume = { theme = "dropdown" },
				oldfiles = { theme = "dropdown" },
				quickfix = { theme = "dropdown" },
				builtin = { theme = "dropdown" },
			},
		})
	end,
}
