local M = {}

local float_ids = {}

local auto_sort_for_todotxt = function()
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = vim.fn.expand("$HOME") .. "/todo/*.txt",
    callback = function()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd("keepjumps keepmarks silent! %sort")
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
  })
end

-- Open all todo files in horizontal splits
local open_all_todo_files = function()
  local todo_dir = vim.fn.expand("$HOME") .. "/todo/"
  local files = vim.fn.glob(todo_dir .. "*.txt", false, true)
  
  if #files == 0 then
    vim.notify("No todo files found in " .. todo_dir, vim.log.levels.WARN)
    return
  end
  
  -- Open first file in current window
  vim.cmd("edit " .. files[1])
  
  -- Open remaining files in horizontal splits
  for i = 2, #files do
    vim.cmd("split " .. files[i])
  end
end

-- Close all todo.txt buffers
local close_all_todo_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local todo_buffers = {}
  
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:match(vim.fn.expand("$HOME") .. "/todo/.*%.txt$") then
        table.insert(todo_buffers, buf)
      end
    end
  end
  
  if #todo_buffers == 0 then
    vim.notify("No todo buffers to close", vim.log.levels.INFO)
    return
  end
  
  for _, buf in ipairs(todo_buffers) do
    if vim.api.nvim_buf_is_valid(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
  
  vim.notify("Closed " .. #todo_buffers .. " todo buffers", vim.log.levels.INFO)
end

M.setup = function()
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = vim.fn.expand("$HOME/todo/") .. "*.txt",
    callback = function()
      vim.bo.filetype = "todotxt"
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "todotxt",
    callback = function()
      require("todotxt.syntax.todotxt")
      auto_sort_for_todotxt()
    end,
  })
  
  -- Add user commands
  vim.api.nvim_create_user_command("TodoOpenAll", open_all_todo_files, {
    desc = "Open all todo.txt files in horizontal splits"
  })
  
  vim.api.nvim_create_user_command("TodoCloseAll", close_all_todo_buffers, {
    desc = "Close all todo.txt buffers"
  })
end

return M
