return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
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
		k("n", "<leader>sk", ":Telescope keymaps<CR>")
		require("telescope").setup({
			pickers = {
				find_files = { theme = "ivy", hidden = true },
				live_grep = { theme = "ivy" },
				buffers = { theme = "ivy" },
				help_tags = { theme = "ivy" },
				resume = { theme = "ivy" },
				oldfiles = { theme = "ivy" },
				quickfix = { theme = "ivy" },
				builtin = { theme = "ivy" },
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
