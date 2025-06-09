local opts = { noremap = true, silent = true }

return {
	{
		"lervag/wiki.vim",
		init = function()
			vim.cmd([[
        let g:wiki_root = '~/storage/shared/personal/wiki'
      ]])

			vim.keymap.set("n", "<leader>wi", ":WikiIndex<CR>", opts)
			vim.keymap.set("n", "<leader>wo", ":WikiOpen<CR>", opts)
			vim.keymap.set("n", "<leader>wt", ":WikiTags<CR>", opts)
			vim.keymap.set("n", "<leader>wf", ":WikiPages<CR>", opts)
			vim.keymap.set("n", "<leader>wl", ":WikiLinks<CR>", opts)
			vim.keymap.set("n", "<leader>wc", ":WikiToc<CR>", opts)
			vim.keymap.set("n", "<A-]>", ":WikiLinkNext<CR>", opts)
			vim.keymap.set("n", "<A-[>", ":WikiLinkPrev<CR>", opts)
			vim.keymap.set("n", "<leader>wj", ":WikiJournal<CR>", opts)
			vim.keymap.set("n", "<leader>wn", ":WikiJournalNext<CR>", opts)
			vim.keymap.set("n", "<leader>wp", ":WikiJournalPrev<CR>", opts)

			vim.g.wiki_select_method = {
				pages = require("wiki.telescope").pages,
				tags = require("wiki.telescope").tags,
				toc = require("wiki.telescope").toc,
				links = require("wiki.telescope").links,
			}
		end,

		config = function()
			vim.cmd([[
        let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
        let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
        let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
        let s:tag_parser.re_parse = '\v#\zs[^# ]+'
        let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}

        let g:wiki_tag_parsers = [s:tag_parser]
      ]])
		end,
	},
	-- {
	-- 	"gaoDean/autolist.nvim",
	-- 	ft = {
	-- 		"markdown",
	-- 		"text",
	-- 		"tex",
	-- 		"plaintex",
	-- 	},
	-- 	config = function()
	-- 		require("autolist").setup()
	--
	-- 		vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
	-- 		vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
	-- 		-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
	-- 		vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
	-- 		vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
	-- 		-- vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
	-- 		vim.keymap.set("n", "<c-x>", "<cmd>AutolistToggleCheckbox<cr><CR>")
	-- 		-- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
	--
	-- 		-- cycle list types with dot-repeat
	-- 		vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
	-- 		vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
	--
	-- 		-- if you don't want dot-repeat
	-- 		-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
	-- 		-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")
	--
	-- 		-- functions to recalculate list on edit
	-- 		vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
	-- 	end,
	-- },
}
