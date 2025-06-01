-- stylua: ignore start
return {
  s(
    {
      trig = "met",
      snippetType = "snippet",
      condition = nil,
      wordTrig = true,
    },
    fmta([[
      ---
      about:
        - <>
      wd: <>
      met: <>
      date: <>
      day: <>
      ---
    ]],
      {
        i(1),
        i(2),
        c(3, { t("true"), t("false") }),
        i(4),
        i(5),
      }
    )
  ),
}
-- stylua: ignore end
