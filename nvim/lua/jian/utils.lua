local M = {}

local api = vim.api

M.rgb = function(r, g, b)
    return string.format("#%02x%02x%02x", r, g, b)
end

local joinpar = api.nvim_create_namespace("JoinParagraph")
M.join_current_paragraph = function()
    local start_line = vim.fn.search('^\\s*$', 'bnW') + 1
    local end_line = vim.fn.search('^\\s*$', 'nW') - 1
    if start_line > end_line then return end

    api.nvim_buf_add_highlight(0, joinpar, "Visual", start_line - 1, 0, -1)
    for l = start_line, end_line - 1 do
        api.nvim_buf_add_highlight(0, joinpar, "Visual", l, 0, -1)
    end

    vim.cmd(string.format("%d,%djoin", start_line, end_line))

    vim.defer_fn(function()
        api.nvim_buf_clear_namespace(0, joinpar, 0, -1)
    end, 200)
end

M.highlight_on_yank = function()
    api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking text",
        callback = function()
            vim.highlight.on_yank()
        end,
    })
end

M.modal_virtualedit = function()
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*",
        callback = function()
            local mode = vim.fn.mode()
            if mode == "n" or mode == "\22" then vim.opt.virtualedit = "all" end
            if mode == "i" then vim.opt.virtualedit = "block" end
            if mode == "v" or mode == "V" then vim.opt.virtualedit = "onemore" end
        end
    })
end


local open_in_explorer = function()
    os.execute("explorer.exe . > /dev/null 2>&1")
end

M.netrw_shortcuts = function()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        callback = function()
            local a = function(desc)
                return { buffer = true, remap = true, desc = desc }
            end
            vim.keymap.set("n", "h", "-", a("up one directory"))
            vim.keymap.set("n", "l", "<CR>", a("goto file/dir"))
            vim.keymap.set("n", "o", open_in_explorer, a("open explorer from netrw"))
        end
    })
end

M.gx_open_in_browser = function()
    local uri = vim.fn.expand('<cWORD>')
    local cmd = { "thorium.exe", uri }
    vim.fn.jobstart(cmd, { detach = true })
end

local diagnostics_virtual_line = function()
    vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
    vim.api.nvim_create_autocmd("CursorMoved", {
        group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
        callback = function()
            vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
            return true
        end,
    })
end

M.lsp_keybinds = function()
    vim.keymap.set("n", "<leader>k", diagnostics_virtual_line)
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
end

M.help_shortcuts = function()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "help",
        callback = function()
            vim.keymap.set("n", "q", "<cmd>bd!<cr>", { buffer = true })
        end
    })
end

M.fold_forward = function()
	local fold = vim.opt.foldlevel + 1
	if fold:get() > 3 then
		print("foldlevel=3")
		return nil
	end
	vim.opt.foldlevel = fold
	print("foldlevel=" .. tostring(vim.opt.foldlevel:get()))
end

M.fold_backward = function()
	local fold = vim.opt.foldlevel - 1
	if fold:get() < 0 then
		print("foldlevel=0")
		return nil
	end
	vim.opt.foldlevel = fold
	print("foldlevel=" .. tostring(vim.opt.foldlevel:get()))
end

return M
