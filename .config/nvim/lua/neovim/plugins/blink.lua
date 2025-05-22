return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdlineEnter" },
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
        auto_show = true,
        border = rounded,
      },
      menu = {
        auto_show = true,
        border = "rounded",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      ["<cr>"] = { "select_and_accept", "fallback" },
      ["<c-e>"] = { "hide", "show", "fallback" }, -- Toggle completion menu
      ["<c-n>"] = { "select_next", "show", "fallback" },
      ["<c-p>"] = { "select_prev", "show", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
      ["<c-k>"] = { "select_prev", "fallback" },
    },
    signature = {
      enabled = true,
      window = {
        max_height = 20,
        max_width = 50,
      },
    },
  },
  opts_extend = { "sources.default" }
}
