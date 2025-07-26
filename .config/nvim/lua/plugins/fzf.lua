return {
    "https://github.com/ibhagwan/fzf-lua",
    config = function()
        local fzf = require('fzf-lua')
        local k = vim.keymap.set
        local d = function(desc)
            return { silent = true, noremap = true, desc = desc }
        end
        k("n", "<a-f>", function() fzf.files({ hidden = true }) end, d("fzf files"))
        k("n", "<a-n>", function() fzf.files({ cwd = '~/.config/nvim' }) end, d("fzf files"))
        k("n", "<a-s-b>", function() fzf.builtin() end, d("fzf builtin"))
        k("n", "<a-h>", function() fzf.helptags() end, d("fzf helptags"))
        k("n", "<a-b>", function() fzf.buffers() end, d("fzf helptags"))
        k("n", "<a-r>", function() fzf.resume() end, d("fzf resume"))
        k("n", "<a-g>", function() fzf.live_grep() end, d("fzf live grep"))
        k("n", "<a-o>", function() fzf.oldfiles() end, d("fzf old files"))
        k("n", "<a-k>", function() fzf.keymaps() end, d("fzf keymaps"))
    end
}
