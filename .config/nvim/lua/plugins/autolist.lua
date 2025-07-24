local k = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {silent = true, desc = desc})
end

return {
  "https://github.com/gaoDean/autolist.nvim",
  ft = {
    "markdown",
    "text",
    "tex",
    "plaintext",
    "norg",
  },
  config = function()
    require("autolist").setup()
    k("i", "<tab>", "<cmd>AutolistTab<cr>", "autolist indent")
    k("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", "autolist dedent")
    k("i", "<cr>", "<cr><cmd>AutolistNewBullet<cr>", "autolist auto bullet")
    k("n", "o", "o<cmd>AutolistNewBullet<cr>", "autolist auto bullet")
    k("n", "O", "O<cmd>AutolistNewBullet<cr>", "autolist auto bullet")
    vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true, desc = "cycle list bullets" })
    vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true, desc = "cycle list bullets" })
    k("n", ">>", ">><cmd>AutolistRecalculate<cr>", "recalculate list")
    k("n", "<<", "<<<cmd>AutolistRecalculate<cr>", "recalculate list")
    k("n", "dd", "dd<cmd>AutolistRecalculate<cr>", "recalculate list")
    k("v", "d", "d<cmd>AutolistRecalculate<cr>", "recalculate list")
    k({"n", "i"}, "<c-x>", "<cmd>AutolistToggleCheckbox<cr>")
  end
}
