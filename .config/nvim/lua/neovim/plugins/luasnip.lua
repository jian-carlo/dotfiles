return {
	"L3MON4D3/LuaSnip",
	event = "VeryLazy",
	config = function()
		local ls = require("luasnip")

		ls.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
		})

		require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })

		vim.keymap.set({ "i" }, "<C-h>", function()
			ls.expand()
		end, { noremap = true, silent = true, desc = "expand snippet" })
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			ls.jump(1)
		end, { silent = true, desc = "jump forward snippet" })
		vim.keymap.set({ "i", "s" }, "<C-k>", function()
			ls.jump(-1)
		end, { silent = true, desc = "jump backward snippet" })

		vim.keymap.set("n", "<leader>rs", function()
			require("luasnip").cleanup()
			require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
			print("Snippets reloaded!")
		end, { desc = "reload luasnip snippets" })

		vim.keymap.set({ "i", "s" }, "<C-c>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
