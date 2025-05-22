return {
	"stevearc/conform.nvim",
  event = "BufWritePre",
  opst = {
      notify_on_error = false,
			formatters_by_ft = {
				tex = { "tex-fmt" },
				lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "black" }
			},
      format_on_save = function()
			-- Stop if we disabled formatting on save.
			if vim.fn.getenv("FORMAT_ON_SAVE") == "false" then
				return nil
			end

			return {
				timeout_ms = 2500,
				lsp_format = "fallback",
			}
		end,
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
