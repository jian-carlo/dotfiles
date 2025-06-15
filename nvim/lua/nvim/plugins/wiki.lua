local opts = function(desc)
	return { silent = true, desc = desc }
end

return {
	{
		"lervag/wiki.vim",
		init = function()
			vim.keymap.set("n", "<leader>wi", ":WikiIndex<CR>", opts("open wiki index"))
			vim.keymap.set("n", "<leader>wj", ":WikiJournal<CR>", opts("open wiki journal"))
			-- vim.keymap.set("n", "<leader>wt", ":WikiTags<CR>", opts("search wiki tags"))
			-- vim.keymap.set("n", "<leader>wf", ":WikiPages<CR>", opts("search wiki files"))
			-- vim.keymap.set("n", "<leader>wl", ":WikiLinks<CR>", opts("search wiki links"))
			-- vim.keymap.set("n", "<leader>wc", ":WikiToc<CR>", opts("search wiki toc"))
			vim.keymap.set("n", "<A-]>", ":WikiLinkNext<CR>", opts("navigate wiki links"))
			vim.keymap.set("n", "<A-[>", ":WikiLinkPrev<CR>", opts("navigate wiki links"))
			vim.keymap.set("n", "<C-A-]>", ":WikiJournalNext<CR>", opts("navigate wiki journal"))
			vim.keymap.set("n", "<C-A-[>", ":WikiJournalPrev<CR>", opts("navigate wiki journal"))

			vim.cmd([[
        let g:wiki_root = '~/personal/wiki'
      ]])

			vim.g.wiki_select_method = {
				pages = require("wiki.telescope").pages,
				tags = require("wiki.telescope").tags,
				toc = require("wiki.telescope").toc,
				links = require("wiki.telescope").links,
			}
		end,

		-- config = function()
		-- 	vim.cmd([[
		--       let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
		--       let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
		--       let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
		--       let s:tag_parser.re_parse = '\v#\zs[^# ]+'
		--       let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}
		--
		--       let g:wiki_tag_parsers = [s:tag_parser]
		--     ]])
		-- end,
	},
	{
		"lervag/lists.vim",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.cmd("ListsEnable")
				end,
			})
			vim.keymap.set("n", "<c-x>", ":ListsToggleCheckbox<CR>", opts("toggle checkbox"))
		end,
		-- |<plug>(lists-toggle)|                <c-s>           `in`
		-- |<plug>(lists-toggle-checkbox)|       NONE            `in`
		-- |i_<plug>(lists-new-element)|         <c-a>           `i`
		-- |<plug>(lists-moveup)|                <leader>wlk     `n`
		-- |<plug>(lists-movedown)|              <leader>wlj     `n`
		-- |<plug>(lists-uniq)|                  <leader>wlu     `n`
		-- |<plug>(lists-uniq-local)|            <leader>wlU     `n`
		-- |<plug>(lists-bullet-toggle-local)|   <leader>wlT     `n`
		-- |<plug>(lists-bullet-toggle-all)|     <leader>wlt     `n`
		-- |<plug>(lists-al)|                    al              `ox`
		-- |<plug>(lists-il)|                    il              `ox`
	},
}
