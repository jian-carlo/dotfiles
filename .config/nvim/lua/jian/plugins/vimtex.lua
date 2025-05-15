return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<localleader>lt", function()
            return require("vimtex.fzf-lua").run()
        end)
        vim.g.vimtex_fold_enabled = true
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_log_verbose = 0
        -- vim.g.vimtex_debug = 1
        -- vim.g.vimtex_compiler = {
        --   "build_dir=build",
        -- }
    end
}
