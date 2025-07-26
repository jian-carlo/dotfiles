return {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    opts = function()
        return {
            ensure_installed = {
                "bash",
                "diff",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "lua",
                "luadoc",
                -- "markdown",
                -- "markdown_inline",
                "powershell",
                "python",
                "vim",
                "latex",
                "typst",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown", }
            },
            indent = {
                enable = true,
                disable = { "markdown" },
            },
        }
    end,
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
}
