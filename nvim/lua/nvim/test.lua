vim.keymap.set("n", "<leader>tt", function()
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({
		prompt_title = "Incomplete Tasks",
		search = "^\\s*\\* \\[ \\]", -- also match blank spaces at the beginning
		search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
		use_regex = true, -- Enable regex for the search term
		-- initial_mode = "normal", -- Start in normal mode
		-- layout_config = {
		-- 	preview_width = 0.5, -- Adjust preview width
		-- },
		additional_args = function()
			return { "--no-ignore" } -- Include files ignored by .gitignore
		end,
	}))
end, { desc = "[P]Search for incomplete tasks" })

vim.keymap.set("n", "<leader>tc", function()
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({
		prompt_title = "Completed Tasks",
		search = "^\\s*\\* \\[x\\]", -- also match blank spaces at the beginning
		search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
		use_regex = true, -- Enable regex for the search term
		-- initial_mode = "normal", -- Start in normal mode
		-- layout_config = {
		-- 	preview_width = 0.5, -- Adjust preview width
		-- },
		additional_args = function()
			return { "--no-ignore" } -- Include files ignored by .gitignore
		end,
	}))
end, { desc = "[P]Search for completed tasks" })
