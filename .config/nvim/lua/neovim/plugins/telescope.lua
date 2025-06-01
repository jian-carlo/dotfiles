return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local k = vim.keymap.set
		k("n", "<leader>s", ":Telescope find_files<CR>")
		k("n", "<leader>g", ":Telescope live_grep<CR>")
		k("n", "<leader><leader>", ":Telescope buffers<CR>")
		k("n", "<leader>h", ":Telescope help_tags<CR>")
		k("n", "<leader>r", ":Telescope resume<CR>")
		k("n", "<leader>o", ":Telescope oldfiles<CR>")
		k("n", "<leader>q", ":Telescope quickfix<CR>")
		-- k("n", "<leader>sp", ":Telescope builtin<CR>")
		require("telescope").setup({
			pickers = {
				find_files = { theme = "dropdown", hidden = true },
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
