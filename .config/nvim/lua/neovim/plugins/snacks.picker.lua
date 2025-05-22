return {
	"folke/snacks.nvim",
	keys = {
    -- stylua: ignore start
    { "<leader>sf", function() Snacks.picker.files() end },
    { "<leader>sb", function() Snacks.picker.buffers() end },
    { "<leader>sw", function() Snacks.picker.lines() end },
    { "<leader>sg", function() Snacks.picker.grep() end },
    { "<leader>sr", function() Snacks.picker.resume() end },
    { "<leader>sq", function() Snacks.picker.qflist() end },
    { "<leader>su", function() Snacks.picker.undo() end },
    { "<leader>sh", function() Snacks.picker.help() end },
    { "<leader>sk", function() Snacks.picker.keymaps() end },
    { "<leader>so", function() Snacks.picker.recent() end },
    { "<leader>sm", function() Snacks.picker.man() end },
    { "<leader>si", function() Snacks.picker.icons() end },
    { "<leader>sl", function() Snacks.picker.lazy() end },
    { "<leader>se", function() Snacks.explorer() end },
		-- stylua: ignore end
	},

	lazy = false,
	enabled = not vim.g.vscode,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}
