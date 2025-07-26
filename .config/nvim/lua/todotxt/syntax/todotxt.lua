vim.cmd([[
  syntax case match

  syntax match TodoTxtUndone "\[ \]"
  syntax match TodoTxtDone "^.*\[x\].*$" contains=TodoTxtPriority,TodoTxtDueWord,TodoTxtDate
  syntax match TodoTxtDueKeyword "due:" nextgroup=TodoTxtDueDate
  syntax match TodoTxtDueDate "\d\{4}-\d\{2}-\d\{2}" contained
  syntax match TodoTxtPriorityA "(A)"
  syntax match TodoTxtPriorityB "(B)"
  syntax match TodoTxtPriorityC "(C)"

  hi def link TodoTxtDone Comment
  hi def link TodoTxtUndone Identifier
  highlight link TodoTxtDueKeyword Special
  highlight link TodoTxtDueDate Constant
]])
