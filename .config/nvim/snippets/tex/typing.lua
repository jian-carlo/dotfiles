-- stylua: ignore start

return {
  s(
    {
      trig = "rf",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        Figure~\ref{fig:<>}
      ]],
      {
        i(1, "id"),
      }
    )
  ),
  s(
    {
      trig = "re",
      snippetType = "snippet",
      condition = nil,
    },
    fmta(
      [[
        Eq.~(\ref{eq:<>})
      ]],
      {
        i(1, "id"),
      }
    )
  ),
}

-- stylua: ignore end
