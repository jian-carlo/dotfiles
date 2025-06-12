require("neovim.keymaps")
require("neovim.options")
require("neovim.netrw")
require("neovim.lazy")
require("neovim.color")
require("neovim.lsp")

-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NormalNC guibg=none")
-- vim.cmd("highlight NormalFloat guibg=none")
-- vim.cmd("highlight Float guibg=none")
-- vim.cmd("highlight FloatBackground guibg=none")
-- vim.cmd("highlight FloatBorder guibg=none")
-- vim.cmd("highlight FloatShadow guibg=none")
-- vim.cmd("highlight Pmenu guibg=none")
-- vim.cmd("highlight PmenuSel guibg=none")
-- vim.cmd("highlight PmenuThumb guibg=none")
-- vim.cmd("highlight PmenuBar guibg=none")

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local state = require("telescope.actions.state")

local function search_todos(opts)
	opts = vim.tbl_extend("force", {
		cwd = vim.loop.os_homedir() .. "/storage/shared/personal/wiki", -- ⚙️ search this folder
	}, opts or {})

	pickers
		.new(opts, {
			prompt_title = "Search TODOs (wiki)",
			finder = finders.new_oneshot_job({ "rg", "--vimgrep", "\\[ \\]" }, {
				cwd = opts.cwd,
				entry_maker = function(line)
					local f, l, c, t = line:match("([^:]+):(%d+):(%d+):(.*)")
					t = t:gsub("\t", " "):gsub("^%s+", ""):gsub("%s+$", "")
					return {
						value = line,
						display = string.format("%s", t),
						ordinal = line,
						filename = f,
						lnum = tonumber(l),
						col = tonumber(c),
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(_, map)
				actions.select_default:replace(function(bufnr)
					actions.close(bufnr)
					local sel = state.get_selected_entry()
					if sel then
						vim.cmd(string.format("edit +%d %s", sel.lnum, sel.filename))
						vim.api.nvim_win_set_cursor(0, { sel.lnum, sel.col - 1 })
					end
				end)
				return true
			end,
		})
		:find()
end

-- To execute the function:
vim.keymap.set("n", "<leader>st", function()
	search_todos(require("telescope.themes").get_dropdown({}))
end, {})
