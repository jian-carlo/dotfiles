local k = vim.keymap.set
vim.g.mapleader = " "

k({ "n", "v" }, "<leader>y", '"+y')
k({ "n", "v" }, "<leader>p", '"+p')

k("n", "<leader>f", ":Explore<CR>")
k("n", "<leader>0", ":Explore ~/.config/nvim<CR>cd")

k("n", "J", "mzJ`z")
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")

k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		k("n", "j", "gj")
		k("n", "k", "gk")
		k("n", "$", "g$")
		k("n", "^", "g^")
	end,
})

k("n", "<leader>dt", function()
	local date = os.date("%Y-%m-%d")
	vim.api.nvim_put({ date }, "c", true, true)
end)
