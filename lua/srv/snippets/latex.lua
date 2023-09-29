---@diagnostic disable: undefined-global
return {
  s(
    { trig = "oo", dscr = "infinity", snippetType = "autosnippet" },
    t { "\\infty" }
  ),
  s({
    trig = "*",
    dscr = "multiplication dot",
    snippetType = "autosnippet",
  }, t { "\\cdot" }),
  s({
    trig = "...",
    dscr = "dots",
    snippetType = "autosnippet",
  }, t { "\\dots" }),
  s(
    { trig = "->", wordTrig = false, dscr = "to", snippetType = "autosnippet" },
    t { "\\to" }
  ),
  s(
    { trig = "<-", wordTrig = false, dscr = "gets", snippetType = "autosnippet" },
    t { "\\gets" }
  ),
  s(
    { trig = "=>", wordTrig = false, dscr = "implies", snippetType = "autosnippet" },
    t { "\\implies" }
  ),

  s({
    trig = "lrp",
    wordTrig = false,
    trigEngine = "pattern",
    dscr = "\\left( \\right)",
    snippetType = "autosnippet",
  }, fmta([[\left( <> \right) ]], i(1))),
  s({
    trig = "lrb",
    wordTrig = false,
    trigEngine = "pattern",
    dscr = "\\left( \\right)",
    snippetType = "autosnippet",
  }, fmta([[\left[ <> \right] ]], i(1))),
  s({
    trig = "lrs",
    wordTrig = false,
    trigEngine = "pattern",
    dscr = "\\left( \\right)",
    snippetType = "autosnippet",
  }, fmta([[\left{ <> \right} ]], i(1))),

  s({
    trig = "::=",
    wordTrig = false,
    dscr = "coloneqq",
    snippetType = "autosnippet",
  }, t { "\\Coloneqq" }),
  s({
    trig = "=<",
    wordTrig = false,
    dscr = "implied by",
    snippetType = "autosnippet",
  }, t { "\\impliedby" }),
  s(
    { trig = ":=", wordTrig = false, dscr = "coloneqq", snippetType = "autosnippet" },
    t { "\\coloneqq" }
  ),
  s(
    { trig = "!=", wordTrig = false, dscr = "neq", snippetType = "autosnippet" },
    t { "\\neq" }
  ),
  s(
    { trig = "==", wordTrig = false, dscr = "equals", snippetType = "autosnippet" },
    t { "&=" }
  ),
  s(
    { trig = "<=>", wordTrig = false, dscr = "iff", snippetType = "autosnippet" },
    t { "\\iff" }
  ),
  s(
    { trig = "|->", wordTrig = false, dscr = "mapsto", snippetType = "autosnippet" },
    t { "\\mapsto" }
  ),
  s(
    { trig = "cc", wordTrig = false, dscr = "subset", snippetType = "autosnippet" },
    t { "\\subset" }
  ),
  s(
    { trig = "c=", wordTrig = false, dscr = "subseteq", snippetType = "autosnippet" },
    t { "\\subseteq" }
  ),
  s(
    { trig = "c!=", wordTrig = false, dscr = "nsubset", snippetType = "autosnippet" },
    t { "\\nsubseteq" }
  ),
  s(
    { trig = "c!", wordTrig = false, dscr = "nsubset", snippetType = "autosnippet" },
    t { "\\nsubset" }
  ),
  s({ trig = "xx", dscr = "times", snippetType = "autosnippet" }, t { "\\times" }),
  s({
    trig = "invs",
    dscr = "inverse",
    wordTrig = false,
    snippetType = "autosnippet",
  }, t { "^{-1}" }),
  s({
    trig = "compl",
    dscr = "complement",
    wordTrig = false,
    snippetType = "autosnippet",
  }, t { "^{c}" }),
  s({
    trig = "\\\\",
    dscr = "setminus",
    snippetType = "autosnippet",
  }, t { "\\setminus" }),
  s({
    trig = "\\0",
    dscr = "emptyset",
    snippetType = "autosnippet",
  }, t { "\\emptyset" }),

  s(
    { trig = "and", dscr = "logic and", snippetType = "autosnippet" },
    t { "\\land" }
  ),
  s({ trig = "or", dscr = "logic or", snippetType = "autosnippet" }, t { "\\lor" }),

  s({ trig = "UU", dscr = "union", snippetType = "autosnippet" }, t { "\\cup" }),
  s(
    { trig = "uuu", dscr = "bigcup", snippetType = "autosnippet" },
    fmta([[\bigcup_{<> \in <>}]], { i(1, "i"), i(2, "I") })
  ),

  s(
    { trig = "Nn", dscr = "intersection", snippetType = "autosnippet" },
    t { "\\cup" }
  ),
  s(
    { trig = "nnn", dscr = "bigcap", snippetType = "autosnippet" },
    fmta([[\bigcap_{<> \in <>}]], { i(1, "i"), i(2, "I") })
  ),

  s(
    { trig = "|", wordTrig = false, dscr = "so that", snippetType = "autosnippet" },
    t { "\\mid" }
  ),
  s({ trig = "bar", dscr = "overbar" }, fmta([[\bar{<>}]], i(0))),

  s(
    {
      trig = "([%a])(%d)",
      wordTrig = true,
      trigEngine = "pattern",
      dscr = "auto subscript",
      snippetType = "autosnippet",
    },
    f(function(_, snip)
      return string.format("%s_%s", snip.captures[1], snip.captures[2])
    end)
  ),
  s(
    {
      trig = "([%a])([ijknmxy])",
      wordTrig = true,
      trigEngine = "pattern",
      dscr = "auto subscript",
      snippetType = "autosnippet",
    },
    f(function(_, snip)
      return string.format("%s_%s", snip.captures[1], snip.captures[2])
    end)
  ),

  s(
    {
      trig = "([\\^\\_])(%d%d)",
      wordTrig = false,
      trigEngine = "pattern",
      dscr = "auto sub/sup-script",
      snippetType = "autosnippet",
    },
    f(function(_, s)
      return string.format("%s{%s}", s.captures[1], s.captures[2])
    end)
  ),
  s(
    {
      trig = "([\\^\\_]){([%d]+)}(%d)",
      wordTrig = false,
      trigEngine = "pattern",
      dscr = "auto sub/sup-script",
      snippetType = "autosnippet",
    },
    f(function(_, s)
      return string.format("%s{%s%s}", s.captures[1], s.captures[2], s.captures[3])
    end)
  ),

  s(
    {
      trig = "(%u)%u",
      wordtrig = true,
      trigEngine = "pattern",
      dscr = "sets",
      snippetType = "autosnippet",
    },
    f(function(_, s)
      return "\\" .. s.captures[1]
    end)
  ),
  s(
    {
      trig = "(\\[NZQRCI])([+-])",
      wordTrig = true,
      trigEngine = "pattern",
      dscr = "auto subscript for sets",
      snippetType = "autosnippet",
    },
    f(function(_, s)
      return string.format("%s_%s", s.captures[1], s.captures[2])
    end)
  ),

  s(
    { trig = "lim", dscr = "limit", snippetType = "autosnippet" },
    fmta([[\lim_{<> \to <>} <>]], { i(1, "n"), i(2, "\\infty"), i(0) })
  ),
  s(
    { trig = "sum", dscr = "sum", snippetType = "autosnippet" },
    fmta([[\sum_{<> = <>}^<> <>]], { i(1, "n"), i(2, "1"), i(2, "\\infty"), i(0) })
  ),
  s(
    { trig = "prod", dscr = "prod", snippetType = "autosnippet" },
    fmta([[\prod_{<> = <>}^<> <>]], { i(1, "n"), i(2, "1"), i(2, "\\infty"), i(0) })
  ),

  s(
    { trig = "multline", dscr = "multline env" },
    fmta(
      [[
        \begin{multline}
          <>
        \end{multline}
      ]],
      i(0)
    )
  ),
  s(
    { trig = "beg", dscr = "\\begin{}/\\end{}" },
    fmta(
      [[
        \begin{<env>}
          <>
        \end{<env>}
      ]],
      { env = i(1), i(0) }
    )
  ),
  s(
    { trig = "ali", dscr = "align env" },
    fmta(
      [[
        \begin{align}
          <>
        \end{align}
      ]],
      i(1)
    )
  ),
  s(
    {
      trig = "([bBpvV])matrix",
      dscr = "matrix environment",
      trigEngine = "pattern",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        \begin{<type>matrix}
          <> 
        \end{<type>matrix}
      ]],
      { type = f(function(_, s)
        return s.captures[1]
      end), i(0) }
    )
  ),

  postfix(
    { trig = ",.", dscr = "turn word into vector", match_pattern = "[%w_]+" },
    { f(function(_)
      return
    end) }
  ),
}
