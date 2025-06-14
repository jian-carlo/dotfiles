local themes = require("telescope.themes")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")
local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")
local job = require("plenary.job")
local path = require("plenary.path")
local wiki = "~/personal/wiki"

local function task_entry_maker(line)
	local f, l, c, t = line:match("([^:]+):(%d+):(%d+):(.*)")
	if not f then
		return
	end

	-- Retain `[x]` but remove leading/trailing spaces and markers like `* -`
	t = t:gsub("^%s*[*%-]?%s*(%[x%])%s*", "%1 ")

	local displayer = entry_display.create({
		separator = " ",
		items = { { remaining = true } },
	})
	local display = displayer({ t })

	return {
		value = line,
		ordinal = t,
		display = display,
		filename = f,
		lnum = tonumber(l),
		col = tonumber(c),
	}
end

local function incomplete_tasks()
	pickers
		.new({
			prompt_title = "Completed Tasks",
			cwd = wiki,
			previewer = previewers.vim_buffer_vimgrep.new({}),
		}, {
			finder = finders.new_oneshot_job({ "rg", "--vimgrep", "\\[x\\]" }, {
				cwd = wiki,
				use_regex = true,
				entry_maker = task_entry_maker,
			}),
			sorter = conf.generic_sorter({}),
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

local function completed_tasks()
	pickers
		.new({
			prompt_title = "Completed Tasks",
			cwd = wiki,
			previewer = previewers.vim_buffer_vimgrep.new({}),
		}, {
			finder = finders.new_oneshot_job({ "rg", "--vimgrep", "\\[\\s\\]" }, {
				cwd = wiki,
				use_regex = true,
				entry_maker = task_entry_maker,
			}),
			sorter = conf.generic_sorter({}),
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

local function wiki_files()
	builtin.find_files({
		prompt_title = "Search Wiki",
		cwd = "~/personal/wiki",
		hidden = false,
		no_ignore = false,
		file_ignore_patterns = { "^journal/", "index" },
	})
end

-- Parse tags like: tags: [one, two, three]
local function parse_tags(line)
	local content = line:match("^%s*tags:%s*%[(.*)%]%s*$")
	if not content then
		return nil
	end
	local tags = {}
	for tag in content:gmatch("([^,%s]+)") do
		table.insert(tags, tag)
	end
	return tags
end

-- Collect all tags and files under a directory
local function get_tags_and_files(directory)
	local tags_set, tag_to_files = {}, {}
	local abs_dir = vim.fn.expand(directory)

	for _, filepath in ipairs(vim.fn.glob(abs_dir .. "/*.md", false, true)) do
		for _, line in ipairs(vim.fn.readfile(filepath)) do
			local tags = parse_tags(line)
			if tags then
				for _, tag in ipairs(tags) do
					tags_set[tag] = true
					tag_to_files[tag] = tag_to_files[tag] or {}
					table.insert(tag_to_files[tag], filepath)
				end
				break
			end
		end
	end

	local tag_list = {}
	for tag in pairs(tags_set) do
		table.insert(tag_list, tag)
	end
	return tag_list, tag_to_files, abs_dir
end

local function open_file_picker_with_buffer_preview(files, cwd)
	pickers
		.new({}, {
			prompt_title = "Files with tag",
			finder = finders.new_table({
				results = files,
				entry_maker = function(entry)
					return {
						value = entry,
						display = path:new(entry):make_relative(cwd),
						ordinal = entry,
					}
				end,
			}),
			previewer = previewers.new_buffer_previewer({
				define_preview = function(self, entry, _)
					if not entry.value then
						vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "Invalid file path!" })
						return
					end
					-- Read file contents
					local lines = vim.fn.readfile(entry.value)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)

					-- Extract and set filetype based on extension
					local file_extension = entry.value:match("^.+%.([a-zA-Z0-9]+)$")
					local filetype = file_extension or "" -- Fallback if no extension
					vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", filetype)
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local sel = state.get_selected_entry()
					vim.cmd("edit " .. sel.value)
				end)
				return true
			end,
		})
		:find()
end

-- Main picker for tags
function create_tag_picker(directory)
	local tags, tag_to_files, abs_dir = get_tags_and_files(directory)

	pickers
		.new({}, {
			prompt_title = "Select Tag",
			finder = finders.new_table({ results = tags }),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local sel = state.get_selected_entry()[1]
					local files = tag_to_files[sel] or {}
					if #files > 0 then
						open_file_picker_with_buffer_preview(files, abs_dir)
					else
						vim.notify("No files for tag " .. sel, vim.log.levels.WARN)
					end
				end)
				return true
			end,
		})
		:find()
end

-------------------------------------------------------------------------
-------------------------------------------------------------------------

vim.keymap.set("n", "<leader>tc", function()
	incomplete_tasks()
end, { desc = "search completed tasks" })

vim.keymap.set("n", "<leader>tt", function()
	completed_tasks()
end, { desc = "search incomplete tasks" })

vim.keymap.set("n", "<leader>wf", function()
	wiki_files()
end, { desc = "search wiki files" })

vim.keymap.set("n", "<leader>wt", function()
	create_tag_picker("~/personal/wiki")
end, { desc = "search wiki tags" })
