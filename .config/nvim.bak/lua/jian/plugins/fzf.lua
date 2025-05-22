local set = vim.keymap.set

return {
	-- {
	--     'nvim-telescope/telescope.nvim',
	--     dependencies = { 'nvim-lua/plenary.nvim' },
	--     config = function()
	--         local builtin = require("telescope.builtin")
	--         set("n", "<leader>sf", builtin.find_files)
	--         set("n", "<leader>sb", builtin.buffers)
	--         set("n", "<leader>sh", builtin.help_tags)
	--         set("n", "<leader>sk", builtin.keymaps)
	--         set("n", "<leader>sg", builtin.git_commits)
	--     end
	-- },
	{
		"ibhagwan/fzf-lua",
		config = function()
			set("n", "<leader>sf", ":FzfLua files<CR>")
			set("n", "<leader>sw", ":FzfLua blines<CR>")
			set("n", "<leader>sb", ":FzfLua buffers<CR>")
			set("n", "<leader>sc", ":FzfLua colorschemes<CR>")
			set("n", "<leader>sh", ":FzfLua helptags<CR>")
			set("n", "<leader>sk", ":FzfLua keymaps<CR>")
			set("n", "<leader>sg", ":FzfLua live_grep_glob<CR>")
			set("n", "<leader>sgc", ":FzfLua git_commits<CR>")
			set("n", "<leader>sgf", ":FzfLua git_files<CR>")
			set("n", "<leader>so", ":FzfLua oldfiles<CR>")
			set("n", "<leader>sr", ":FzfLua resume<CR>")
			set("n", "<leader>sq", ":FzfLua quickfix<CR>")
			set("n", "<leader>sgg", function()
				require("fzf-lua").grep({
					prompt = "First grep> ",
					search = "first-query",
					on_select = function(selected)
						require("fzf-lua").grep({
							prompt = "First grep> ",
							search = "first-query",
							input = selected,
						})
					end,
				})
			end)
		end,
	},
}
