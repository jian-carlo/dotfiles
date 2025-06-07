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
		end,
	},
}
