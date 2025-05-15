return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        config = function()
            require("render-markdown").setup({})
        end,
    },
    -- {
    --     "OXY2DEV/markview.nvim",
    --     lazy = false,
    --     dependencies = "saghen/blink.cmp"
    -- },
    -- -- I don't like the look of this one
}
