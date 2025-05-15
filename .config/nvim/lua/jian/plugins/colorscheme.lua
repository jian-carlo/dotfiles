return {
    -- {
    --     "savq/melange-nvim",
    --     -- lazy = false,
    --     -- priority = 1000,
    --     -- config = function()
    --     --     vim.cmd.colorscheme("melange")
    --     -- end
    -- },
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("nord")
        end
    },
    -- {
    --     "sainnhe/gruvbox-material",
    --     -- lazy = false,
    --     -- priority = 1000,
    --     -- config = function()
    --     --     vim.g.gruvbox_material_background = "hard"
    --     --     vim.cmd.colorscheme("gruvbox-material")
    --     -- end
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("gruvbox")
    --     end
    -- },
    -- "gbprod/nord.nvim",
    -- config = function()
    --     vim.cmd.colorscheme("nord")
    -- end
    -- "AlexvZyl/nordic.nvim",
    -- config = function()
    --     vim.cmd.colorscheme("nordic")
    -- end
}
