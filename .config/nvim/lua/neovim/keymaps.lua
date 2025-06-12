local k = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

k({ "n", "v" }, "<leader>y", '"+y', opts)
k({ "n", "v" }, "<leader>p", '"+p', opts)

k("n", "<leader>f", ":Explore<CR>", opts)
k("n", "<leader>0", ":Explore ~/.config/nvim<CR>cd", opts)

k("n", "J", "mzJ`z", opts)
k("n", "<C-d>", "<C-d>zz", opts)
k("n", "<C-u>", "<C-u>zz", opts)
k("n", "n", "nzzzv", opts)
k("n", "N", "Nzzzv", opts)

k("v", "J", ":m '>+1<CR>gv=gv", opts)
k("v", "K", ":m '<-2<CR>gv=gv", opts)

k("v", ">", ">gv", opts)
k("v", "<", "<gv", opts)

k("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		return vim.diagnostic.enable(false, {})
	else
		return vim.diagnostic.enable()
	end
end, { desc = "toggle diagnostics" })

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

k("n", "<leader>dt", function()
	local date = os.date("%Y-%m-%d %A")
	vim.api.nvim_put({ date }, "c", true, true)
end, opts)

k("n", "<leader>tn", function()
	local time_in_seconds = os.time()
	local formatted_time = "## (" .. os.date("%H:%M", time_in_seconds) .. ")"
	vim.api.nvim_put({ formatted_time }, "c", true, true)
end, opts)

k("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
