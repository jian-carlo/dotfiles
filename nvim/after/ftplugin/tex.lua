vim.cmd([[
      set foldmethod=expr
      set foldexpr=vimtex#fold#level(v:lnum)
      set foldtext=vimtex#fold#text()
      set foldlevel=1
    ]])
