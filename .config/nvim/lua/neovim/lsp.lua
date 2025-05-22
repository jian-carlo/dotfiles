vim.lsp.enable("texlab")
vim.lsp.enable("pyright")
vim.lsp.enable("luals")

--diagnostics-- diagnostics
vim.keymap.set("n", "<leader>k", function()
	vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
		callback = function()
			vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
			return true
		end,
	})
end, { desc = "toggle virtual line diagnostics" })

-- blink.cmp
local gapabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Function to set LSP keymaps
local on_attach = function(client, bufnr)
	-- Helper function for setting keymaps
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Keymaps for LSP functionality
	nmap("gd", vim.lsp.buf.definition, "Go to Definition") -- Jump to definition
	nmap("gr", vim.lsp.buf.references, "Show References") -- List references
	nnap("gi", vim.lsp.buf.implementation, "Go to Implementation") -- Jump to implementation
	nmap("K", vim.lsp.buf.hover, "Hover Documentation") -- Show hover doc
	nmap("<leader>rn", vim.lsp.buf.rename, "Rename Symbol") -- Rename a symbol
	nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action") -- Show code actions
	nmap("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols") -- Document symbols
	nmap("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols") -- Workspace symbols

	-- Diagnostics navigation
	nmap("[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic") -- Previous diagnostic
	nmap("]d", vim.diagnostic.goto_next, "Go to Next Diagnostic") -- Next diagnostic
	nmap("<leader>e", vim.diagnostic.open_float, "Show Diagnostic Info") -- Show diagnostic details
end
