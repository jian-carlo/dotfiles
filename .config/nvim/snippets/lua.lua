return {
    s(
        {
            trig = "snip",
            snippetType = "snippet",
        },
        fmta([=[
      s(
        {
          trig = "<>",
          snippetType = "<>",
          condition = <>,
        },
        fmta(
          [[
            <>
          ]],
          {
            <>
          }
        )
      ),
    ]=],
            {
                i(1),
                c(2, { t("snippet"), t("autosnippet") }),
                i(3, "nil"),
                i(4, "-- snippet content"),
                i(5, "-- nodes"),
            }
        )
    ),
}
