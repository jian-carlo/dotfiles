return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- {
		-- 	"nvim-telescope/telescope-fzf-native.nvim",
		-- 	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		-- },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local k = vim.keymap.set
		telescope.setup({
			pickers = {
				find_files = { theme = nil, hidden = true },
				live_grep = { theme = nil },
				buffers = { theme = nil },
				help_tags = { theme = nil },
				resume = { theme = nil },
				oldfiles = { theme = nil },
				quickfix = { theme = nil },
				builtin = { theme = nil },
			},
			-- extensions = {
			-- 	fzf = {
			-- 		fuzzy = true,
			-- 		override_generic_sorter = true,
			-- 		override_file_sorter = true,
			-- 		case_mode = "smart_case",
			-- 	},
			-- },
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
		-- require("telescope").load_extension("fzf")
	end,
}
