local M = {}

M.d = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

M.rgb = function(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

M.light_or_dark = function()
  if _G.black_and_white == 0 then
    if vim.o.background == "dark" then
      vim.o.background = "light"
      vim.cmd("colo default")
    elseif vim.o.background == "light" then
      vim.o.background = "dark"
      vim.cmd("colo vague")
    end
  elseif _G.black_and_white == 1 then
    if vim.o.background == "dark" then
      vim.o.background = "light"
    elseif vim.o.background == "light" then
      vim.o.background = "dark"
    end
  end
end

M.open_in_explorer = function()
  os.execute("explorer.exe . > /dev/null 2>&1")
end

-- comment
M.black_and_white = function()
  if _G.black_and_white == 0 then
    _G.black_and_white = 1
    vim.cmd.colorscheme("quiet")
  else
    _G.black_and_white = 0
    if vim.o.background == "dark" then
      vim.cmd.colorscheme("vague")
    elseif vim.o.background == "light" then
      vim.cmd.colorscheme("default")
    end
  end
end

return M
