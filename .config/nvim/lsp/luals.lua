return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	Lua = {
		runtime = {
			version = "LuaJIT",
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
		diagnostics = {
			globals = {
				"vim",
				"require",
			},
		},
		telemetry = {
			enabled = false,
		},
	},
}
