local opt = vim.opt

opt.nu = true
opt.rnu = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.laststatus = 3
opt.showtabline = 0
vim.cmd("set mouse=")
opt.wrap = false
opt.cmdheight = 0
opt.updatetime = 300
opt.timeoutlen = 500
vim.cmd([[
if has('termguicolors')
    set termguicolors
    endif
]])

-- autocommand to set tab size for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt.tabstop = 2 -- Number of spaces for a tab
		vim.opt.shiftwidth = 2 -- Number of spaces for indentation
		vim.opt.expandtab = true -- Convert tabs to spaces
	end,
})
