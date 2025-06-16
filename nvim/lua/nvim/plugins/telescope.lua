return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		require("telescope").load_extension("fzf")
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local k = vim.keymap.set
		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
			},
			pickers = {
				find_files = { hidden = true },
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
		k("n", "<leader>sf", ":Telescope find_files<CR>")
		k("n", "<leader>sg", ":Telescope live_grep<CR>")
		k("n", "<leader>sb", ":Telescope buffers<CR>")
		k("n", "<leader>sh", ":Telescope help_tags<CR>")
		k("n", "<leader>sr", ":Telescope resume<CR>")
		k("n", "<leader>so", ":Telescope oldfiles<CR>")
		k("n", "<leader>sq", ":Telescope quickfix<CR>")
		k("n", "<leader>sk", ":Telescope keymaps<CR>")
		k("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
