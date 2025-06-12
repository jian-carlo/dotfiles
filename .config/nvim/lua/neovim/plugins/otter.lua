return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set("n", "<leader>mc", function()
			require("otter").activate()
		end, {})
	end,
}
