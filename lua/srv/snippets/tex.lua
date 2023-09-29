---@diagnostic disable: undefined-global
return {
  s(
    { trig = "se", dscr = "add latex section" },
    fmta(
      [[
      \section{<name>}\label{sec:<>} % (fold)
      
      <>

      % section "<name>" (end)
      ]],
      {
        name = i(1, "name"),
        l(l._1:gsub(" ", "_"):lower(), 1),
        i(2),
      },
      { repeat_duplicates = true }
    )
  ),
  s({ trig = "peppe", dscr = "peppe" }, fmt("\\infty", {})),

  -- s({ trig = "oo" }, t { "\\infty" }),
}
