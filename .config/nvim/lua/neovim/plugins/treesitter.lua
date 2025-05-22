return {
	"nvim-treesitter/nvim-treesitter",
	opts = function()
		return {
			auto_install = true, -- Auto-install languages that are not installed
			-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
			ensure_installed = {
				"bash",
				"css",
				"csv",
				"diff",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"lua",
				"luadoc",
				"markdown",
				"powershell",
				"python",
				"vim",
			},
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 1024 * 1024 -- 1 Mb threshold
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end

					return false
				end,
			},
			indent = {
				enable = true,
			},
		}
	end,

	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		{ -- Syntax aware text objects.
			-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
}
