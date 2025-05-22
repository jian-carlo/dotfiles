return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>sf", function() Snacks.picker.smart() end },
    { "<leader>sb", function() Snacks.picker.buffers() end },
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
  },

    lazy = false,
    enabled = not vim.g.vscode,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
}
