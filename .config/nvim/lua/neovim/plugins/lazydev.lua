return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		debug = true,
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
