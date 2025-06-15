vim.cmd([[
      set foldmethod=expr
      set foldexpr=vimtex#fold#level(v:lnum)
      set foldlevel=1
      "set foldtext=vimtex#fold#text()
      "set fillchars=fold:\ 
      ]])
