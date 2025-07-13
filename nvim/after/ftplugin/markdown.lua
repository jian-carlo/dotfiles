vim.opt.foldtext = ""
vim.opt.foldlevel = 3

local opt = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

local fold_forward = function()
	local fold = vim.opt.foldlevel + 1
	if fold:get() > 3 then
		print("foldlevel=3")
		return nil
	end
	vim.opt.foldlevel = fold
	print("foldlevel=" .. tostring(vim.opt.foldlevel:get()))
end

local fold_backward = function()
	local fold = vim.opt.foldlevel - 1
	if fold:get() < 0 then
		print("foldlevel=0")
		return nil
	end
	vim.opt.foldlevel = fold
	print("foldlevel=" .. tostring(vim.opt.foldlevel:get()))
end

local k = vim.keymap.set

k("n", "z.", function()
	fold_forward()
end, opt("cycle through foldlevels"))

k("n", "z,", function()
	fold_backward()
end, opt("cycle through foldlevels"))
