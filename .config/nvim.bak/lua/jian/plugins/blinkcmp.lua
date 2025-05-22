return {
    "saghen/blink.cmp",
    version = "*",
    opts = {
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = { 
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
            documentation = { 
                auto_show = true ,
                border = rounded,
            },
            menu = {
                border = "rounded",
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
}
