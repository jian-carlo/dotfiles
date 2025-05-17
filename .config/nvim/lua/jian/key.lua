local keymap = vim.keymap.set
vim.g.mapleader = " "

keymap({ "n", "v" }, "<leader>y", '"+y')
keymap({ "n", "v" }, "<leader>p", '"+p')

keymap("n", "<leader>f", ":Explore<CR>")
keymap("n", "<leader>0", ":Explore ~/.config/nvim<CR>cd")
keymap("n", "<leader>1", ":Explore ~/projects/thermo-problem-set/<CR>cd")
keymap("n", "<leader>2", ":Explore ~/projects/obsidian_vault/<CR>cd")

keymap("n", "<C-t>", ":enew<CR>")
keymap("n", "<C-w>", ":bd!<CR>")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
