---@diagnostic disable: undefined-global

local snip = require("srv.utils.fn").snippets.snip

---Formats a Greek letter snippet to latex syntax (eg. `@al` --> `\alpha`)
---@param captures table<string> The regex matches from the LuaSnip trigger.
---@param ending? string The string to append to the regex match. Defaults to `""`
---@param upper? string The uppercase variant (if present) of the lowercase letter. This is present for letters whose uppercase version do not have a LaTeX command (eg. `\alpha` -> `A`). Defaults to `""`
---@return string command The LaTeX command (or letter) corresponding to the trigger.
local function fmt_greek(captures, ending, upper)
  local idx = (#captures < 2 and 1 or 2) ---variant check (eg. `@vep` -> `varepsilon`)
  return captures[idx]:match "%u" and upper ---return the uppercase letter if given
    or string.format( ---otherwise format the captures accordingly
      [[\%s%s]], ---the format template
      ((captures[idx - 1] and captures[idx - 1]:match "v") and "var" or "")
        .. captures[idx], ---use either the 1st capture (for non-variant) or 2nd
      ending or "" ---append the ending string if given
    )
end

---@type table Table containing the various parenthesis
local parentheses = {
  p = { "(", ")" },
  b = { "[", "]" },
  s = { "\\{", "\\}" },
  a = { "\\langle ", "\\rangle" },
}

return {
  ----------------------------------------------------------------------------------
  ---// POSTFIX // -----------------------------------------------------------------
  ----------------------------------------------------------------------------------

  ---faster binom
  postfix({
    trig = ";;",
    name = "binomial coefficient",
    match_pattern = "\\?[%a%w]!?$",
    snippetType = "autosnippet",
  }, fmta([[\binom{<>}{<>}]], { l(l.POSTFIX_MATCH), i(1, "k") })),

  ---auto-fractions
  postfix({
    trig = "//",
    name = "fraction",
    match_pattern = "%(.+%)$",
    snippetType = "autosnippet",
  }, fmta([[\frac{<>}{<>}]], { l(l.POSTFIX_MATCH:gsub("^%((.+)%)$", "%1")), i(1) })),

  postfix({
    trig = "//",
    name = "fraction",
    match_pattern = "\\?%w+!?$",
    snippetType = "autosnippet",
  }, fmta([[\frac{<>}{<>}]], { l(l.POSTFIX_MATCH), i(1) })),

  ---Font changing
  postfix(
    { trig = ".bb", name = "postfix mathbb", match_pattern = "\\?%w+$" },
    l("\\mathbb{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".bf", name = "postfix mathbf", match_pattern = "\\?%w+$" },
    l("\\mathbf{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".it", name = "postfix mathit", match_pattern = "\\?%w+$" },
    l("\\mathit{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".tt", name = "postfix mathtt", match_pattern = "\\?%w+$" },
    l("\\mathtt{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".rm", name = "postfix mathrm", match_pattern = "\\?%w+$" },
    l("\\mathrm{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".sf", name = "postfix mathsf", match_pattern = "\\?%w+$" },
    l("\\mathsf{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".cal", name = "postfix mathcal", match_pattern = "\\?%w+$" },
    l("\\mathcal{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".src", name = "postfix mathsrc", match_pattern = "\\?%w+$" },
    l("\\mathsrc{" .. l.POSTFIX_MATCH .. "}")
  ),
  postfix(
    { trig = ".frak", name = "postfix mathfrak", match_pattern = "\\?%w+$" },
    l("\\mathfrak{" .. l.POSTFIX_MATCH .. "}")
  ),

  ---Accents and marks
  postfix({
    trig = ".^",
    "postfix \\hat{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\hat{" .. l.POSTFIX_MATCH .. "}")),
  postfix({
    trig = ".=",
    "postfix \\overline{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\overline{" .. l.POSTFIX_MATCH .. "}")),
  postfix({
    trig = ".vv",
    "postfix \\vec{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\vec{" .. l.POSTFIX_MATCH .. "}")),
  postfix({
    trig = ".-",
    "postfix \\bar{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\bar{" .. l.POSTFIX_MATCH .. "}")),
  postfix({
    trig = ".dot",
    "postfix \\dot{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\dot{" .. l.POSTFIX_MATCH .. "}")),
  postfix({
    trig = ".ddot",
    "postfix \\ddot{}",
    match_pattern = "\\?%w+_?[%d%a]?$",
    snippetType = "autosnippet",
  }, l("\\ddot{" .. l.POSTFIX_MATCH .. "}")),

  ----------------------------------------------------------------------------------
  ---// AUTOSNIPPETS // ------------------------------------------------------------
  ----------------------------------------------------------------------------------

  ---auto-escape some symbols
  s(snip("%%", "% symbol", "", "autosnippet"), t { [[\%]] }),
  s(snip("&&", "& symbol", "", "autosnippet"), t { [[\&]] }),
  s(snip("##", "# symbol", "", "autosnippet"), t { [[\#]] }),

  ---Greek letters
  s( ---ALPHA
    snip("@([Aa]l)", "alpha", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "pha", "A")
    end)
  ),
  s( ---BETA
    snip("@([Bb]e)", "beta", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "ta", "B")
    end)
  ),
  s( ---GAMMA
    snip("@([Gg]a)", "gamma", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "mma")
    end)
  ),
  s( ---DELTA
    snip("@([Dd]e)", "delta", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "lta")
    end)
  ),
  s( ---EPSILON
    snip("@(v?)([Ee]p)", "epsilon", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "silon", "E")
    end)
  ),
  s( ---ZETA
    snip("@([Zz]e)", "zeta", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "ta", "Z")
    end)
  ),
  s( ---ETA
    snip("@([Ee]t)", "eta", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "a", "H")
    end)
  ),
  s( ---THETA
    snip("@(v?)([Tt]h)", "theta", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "eta")
    end)
  ),
  s( ---IOTA
    snip("@([Ii]o)", "iota", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "ta", "I")
    end)
  ),
  s( ---KAPPA
    snip("@([Kk]a)", "kappa", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "ppa", "K")
    end)
  ),
  s( ---LAMBDA
    snip("@([Ll]a)", "lambda", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "mbda")
    end)
  ),
  s( ---MU
    snip("@([Mm]u)", "mu", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "", "M")
    end)
  ),
  s( ---NU
    snip("@([Nn]u)", "nu", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "", "N")
    end)
  ),
  s( ---XI
    snip("@([Xx]i)", "xi", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures)
    end)
  ),
  s( ---OMICRON
    snip("@([Oo]M)", "omicron", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return s.captures[1]:gsub(".$", "")
    end)
  ),
  s( ---PI
    snip("@([Pp]i)", "pi", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures)
    end)
  ),
  s( ---RHO
    snip("@(v?)([Rr]h)", "rho", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "o", "P")
    end)
  ),
  s( ---SIGMA
    snip("@([Ss]i)", "sigma", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "gma")
    end)
  ),
  s( ---TAU
    snip("@([Tt]a)", "tau", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "u", "T")
    end)
  ),
  s( ---UPSILON
    snip("@([Uu]p)", "upsilon", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "silon")
    end)
  ),
  s( ---PHI
    snip("@(v?)([Pp]h)", "phi", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "i")
    end)
  ),
  s( ---CHI
    snip("@([Cc]h)", "chi", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "i", "X")
    end)
  ),
  s( ---PSI
    snip("@([Pp]s)", "psi", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "i")
    end)
  ),
  s( ---OMEGA
    snip("@([Oo]m)", "omega", "", "autosnippet", false, "pattern"),
    f(function(_, s)
      return fmt_greek(s.captures, "ega")
    end)
  ),

  ---Fonts
  s(snip("#bb", "mathbb", "", "autosnippet", false), fmta([[\mathbb{<>}]], i(1))),
  s(snip("#bf", "mathbf", "", "autosnippet", false), fmta([[\mathbf{<>}]], i(1))),
  s(snip("#it", "mathit", "", "autosnippet", false), fmta([[\mathit{<>}]], i(1))),
  s(snip("#tt", "mathtt", "", "autosnippet", false), fmta([[\mathtt{<>}]], i(1))),
  s(snip("#rm", "mathrm", "", "autosnippet", false), fmta([[\mathrm{<>}]], i(1))),
  s(snip("#sf", "mathsf", "", "autosnippet", false), fmta([[\mathsf{<>}]], i(1))),
  s(snip("#cal", "mathcal", "", "autosnippet", false), fmta([[\mathcal{<>}]], i(1))),
  s(snip("#scr", "mathscr", "", "autosnippet", false), fmta([[\mathscr{<>}]], i(1))),
  s(
    snip("#frak", "mathfrak", "", "autosnippet", false),
    fmta([[\mathfrak{<>}]], i(1))
  ),

  ---Arrows
  s(
    snip("<->", "left-right arrow", "", "autosnippet", false),
    t { [[\leftrightarrow]] }
  ),
  s(snip("->", "right arrow", "", "autosnippet", false), t { [[\rightarrow]] }),
  s(snip("=>", "right arrow", "", "autosnippet", false), t { [[\Rightarrow]] }),
  s(snip("-<", "left arrow", "", "autosnippet", false), t { [[\leftarrow]] }),
  s(snip("=<", "left arrow", "", "autosnippet", false), t { [[\Leftarrow]] }),
  s(
    snip("<=>", "left-right arrow", "", "autosnippet", false),
    t { [[\Leftrightarrow]] }
  ),
  s(snip("|->", "maps to", "", "autosnippet", false), t { [[\mapsto]] }),
  s(snip("|-->", "long maps to", "", "autosnippet", false), t { [[\longmapsto]] }),

  ---Miscellaneous symbols faster
  s(snip("ooo", "infinity", "", "autosnippet", false), t { [[\infty]] }),
  s(snip("AA", "for all", "", "autosnippet", false), t { [[\forall]] }),
  s(snip("Re", "real part", "", "autosnippet", false), t { [[\Re]] }),
  s(snip("Im", "imaginary part", "", "autosnippet", false), t { [[\Im]] }),
  s(snip("VV", "nabla", "", "autosnippet", false), t { [[\nabla]] }),
  s(snip("EE", "exists", "", "autosnippet", false), t { [[\exists]] }),
  s(
    snip("part", "partial derivative", "", "autosnippet", false),
    t { [[\partial]] }
  ),
  s(snip("nEE", "does not exists", "", "autosnippet", false), t { [[\nexists]] }),
  s(snip("\\0", "empty set", "", "autosnippet", false), t { [[\emptyset]] }),
  s(snip("/0", "nothing", "", "autosnippet", false), t { [[\nothing]] }),
  s(snip("wp", "Weierstrass elliptic fn", "", "autosnippet", false), t { [[\wp]] }),
  s(snip("comp", "complement", "", "autosnippet", false), t { [[^\mathsf{c}]] }),
  s(snip("inv", "inverse", "", "autosnippet", false), t { [[^{-1}]] }),
  s(snip("not", "logical negation", "", "autosnippet", false), t { [[\neg]] }),
  s(snip("...", "ellipsis", "", "autosnippet", false), t { [[\dots]] }),
  s(snip([[s\\\]], "set minus", "", "autosnippet", false), t { [[\smallsetminus]] }),
  s(snip([[\\\]], "set minus", "", "autosnippet", false), t { [[\setminus]] }),

  s(snip("xx", "times", "", "autosnippet", false), t { [[\times]] }),
  s(snip("**", "multiplication", "", "autosnippet", false), t { [[\cdot]] }),
  s(snip("!=", "neq", "", "autosnippet", false), t { [[\neq]] }),
  s(snip("<=", "lesser than", "", "autosnippet", false), t { [[\leq]] }),
  s(snip(">=", "greater than", "", "autosnippet", false), t { [[\geq]] }),
  s(snip(">>", "much greater than", "", "autosnippet", false), t { [[\gg]] }),
  s(snip("<<", "much greater than", "", "autosnippet", false), t { [[\ll]] }),
  s(snip("perp", "perpendicular", "", "autosnippet", false), t { [[\perp]] }),
  s(snip("notin", "not included", "", "autosnippet", false), t { [[\notin]] }),
  s(snip("cc", "subset", "", "autosnippet", false), t { [[\subset]] }),
  s(snip("c=", "subseteq", "", "autosnippet", false), t { [[\subseteq]] }),
  s(snip("!c", "nsubset", "", "autosnippet", false), t { [[\nsubset]] }),
  s(snip("AND", "logical and", "", "autosnippet", false), t { [[\land]] }),
  s(snip("OR", "logical or", "", "autosnippet", false), t { [[\lor]] }),
  s(snip("equiv", "equivalence", "", "autosnippet", false), t { [[\equiv]] }),
  s(snip("cong", "cong", "", "autosnippet", false), t { [[\cong]] }),
  s(snip("::", "colon", "", "autosnippet", false), t { [[\colon]] }),
  s(snip(":=", "coloneqq", "", "autosnippet", false), t { [[\coloneqq]] }),
  s(snip("\\colon=", "coloneqq", "", "autosnippet", false), t { [[\Coloneqq]] }),
  s(snip("==", "aligned equals", "", "autosnippet", false), t { "&=" }),
  s(snip("lll", "ell", "", "autosnippet", false), t { [[\ell]] }),

  s(snip("uuu", "union", "", "autosnippet", false), t { [[\cup]] }),
  s(snip("nnn", "intersection", "", "autosnippet", false), t { [[\cap]] }),

  s(
    snip("\\cup[uU]", "big union", "", "autosnippet", false, "pattern"),
    fmta([[\bigcup_{<> = <>}^<>]], { i(1, "i"), i(2, "1"), i(3, "\\infty") })
  ),
  s(
    snip("\\cap[nN]", "big intersection", "", "autosnippet", false, "pattern"),
    fmta([[\bigcap_{<> = <>}^<>]], { i(1, "i"), i(2, "1"), i(3, "\\infty") })
  ),
  s(
    snip("\\cup[nN]", "union to intersection", "", "autosnippet", false, "pattern"),
    t { [[\cap]] }
  ),
  s(
    snip("\\cap[uU]", "intersection to union", "", "autosnippet", false, "pattern"),
    t { [[\cup]] }
  ),

  ---Accent and marks
  s(snip("what", "widehat", ""), fmta([[\widehat{<>}]], i(1))),
  s(snip("hat", "hat", ""), fmta([[\hat{<>}]], i(1))),
  s(snip("vv", "vec", ""), fmta([[\vec{<>}]], i(1))),
  s(snip("bar", "bar", ""), fmta([[\bar{<>}]], i(1))),
  s(snip("ddot", "ddot", ""), fmta([[\ddot{<>}]], i(1))),
  s(snip("dot", "dot", ""), fmta([[\dot{<>}]], i(1))),
  s(snip("ove", "overline", ""), fmta([[\overline{<>}]], i(1))),

  ---Sets
  s(snip("NN", "N", "", "autosnippet", false), t { [[\mathbb{N}]] }),
  s(snip("ZZ", "Z", "", "autosnippet", false), t { [[\mathbb{Z}]] }),
  s(snip("QQ", "Q", "", "autosnippet", false), t { [[\mathbb{Q}]] }),
  s(snip("RR", "R", "", "autosnippet", false), t { [[\mathbb{R}]] }),
  s(snip("CC", "C", "", "autosnippet", false), t { [[\mathbb{C}]] }),
  s(snip("FF", "F", "", "autosnippet", false), t { [[\mathfrak{F}]] }),
  s(snip("set", "set", "", "autosnippet"), fmta([[\{\,<>\,\}]], i(1))),
  s(
    snip(
      "(\\mathbb{[NZQRCI]})([%+-*])",
      "set supscript",
      "",
      "autosnippet",
      false,
      "pattern"
    ),
    l(l.LS_CAPTURE_1 .. "^" .. l.LS_CAPTURE_2:gsub("%*", "\\ast"))
  ),

  ---Trigonometry
  s(snip("sin", "sin", "", "autosnippet", false), t { [[\sin]] }),
  s(snip("cos", "cos", "", "autosnippet", false), t { [[\cos]] }),
  s(snip("tan", "tan", "", "autosnippet", false), t { [[\tan]] }),
  s(snip("cot", "cot", "", "autosnippet", false), t { [[\cot]] }),
  s(snip("sec", "sec", "", "autosnippet", false), t { [[\sec]] }),
  s(snip("csc", "cosec", "", "autosnippet", false), t { [[\csc]] }),
  s(snip("arcsin", "arcsin", "", "autosnippet", false), t { [[\arcsin]] }),
  s(snip("arccos", "arccos", "", "autosnippet", false), t { [[\arccos]] }),
  s(snip("arctan", "arctan", "", "autosnippet", false), t { [[\arctan]] }),

  ---Functions
  s(
    snip("n^2rt", "square root of n", "", "autosnippet", false),
    fmta([[\sqrt[<>]{<>}]], { i(1), i(2) })
  ),
  s(
    snip("^2rt", "square root", "", "autosnippet", false),
    fmta([[\sqrt{<>}]], i(1))
  ),
  s(snip("ln", "natural log", "", "autosnippet", false), t { [[\ln]] }),
  s(snip("log", "logarithm", "", "autosnippet", false), t { [[\log]] }),
  s(snip("lo2", "logarithm base 2", "", "autosnippet", false), t { [[\log_2]] }),
  s(snip("max", "maximum", "", "autosnippet", false), t { [[\max]] }),
  s(snip("min", "minimum", "", "autosnippet", false), t { [[\min]] }),
  s(snip("sup", "sup", "", "autosnippet", false), t { [[\sup]] }),
  s(snip("inf", "inf", "", "autosnippet", false), t { [[\inf]] }),
  s(
    snip("sum", "summation", "", "autosnippet"),
    fmta([[\sum_{<> = <>}^<>]], { i(1, "i"), i(2, "1"), i(3, "\\infty") })
  ),
  s(
    snip("prod", "product", "", "autosnippet"),
    fmta([[\prod_{<> = <>}^<>]], { i(1, "i"), i(2, "1"), i(3, "\\infty") })
  ),
  s(
    snip("lim", "limit", "", "autosnippet"),
    fmta([[\lim_{<> \to <>}]], { i(1, "i"), i(2, "\\infty") })
  ),
  s(
    snip("binom", "binomial coefficients", "", "autosnippet"),
    fmta([[\binom{<>}{<>}]], { i(1, "n"), i(2, "k") })
  ),
  s(snip("o+", "oplus", "", "autosnippet", false), t { [[\oplus]] }),
  s(snip("oX", "otimes", "", "autosnippet", false), t { [[\otimes]] }),
  s(snip("pu", "physical units", "", "autosnippet", false), fmta([[\pu{<>}]], i(1))),
  s(snip("sq", "squared", "", "autosnippet", false), t { "^2" }),

  ---Fractions
  s(
    snip("//", "fraction", "", "autosnippet"),
    fmta([[\frac{<>}{<>}]], { i(1), i(2) })
  ),

  ---Parenthesis
  s(
    {
      trig = "lr([pbsa])",
      dscr = "left/right paren",
      trigEngine = "pattern",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    fmt([[\left{}{}\right{}]], {
      f(function(_, s)
        return parentheses[s.captures[1]][1]
      end),
      i(1),
      f(function(_, s)
        return parentheses[s.captures[1]][2]
      end),
    })
  ),

  ---Auto sub/sup-script
  s(snip("__", "subscript", "", "autosnippet", false), fmta([[_{<>}]], i(1))),
  s(snip("^^", "supscript", "", "autosnippet", false), fmta([[^{<>}]], i(1))),

  s(
    snip("\\?([%a])(%d)", "subscript", "", "autosnippet", true, "pattern"),
    l(l.LS_CAPTURE_1 .. "_" .. l.LS_CAPTURE_2)
  ),

  s(
    snip("([%^_])(%d%d)", "sub/sup-scrip", "", "autosnippet", false, "pattern"),
    l(l.LS_CAPTURE_1 .. "{" .. l.LS_CAPTURE_2 .. "}")
  ),
  s(
    snip(
      "([%^_]){([%d]+)}(%d)",
      "sub/sup-scrip",
      "",
      "autosnippet",
      false,
      "pattern"
    ),
    l(l.LS_CAPTURE_1 .. "{" .. l.LS_CAPTURE_2 .. l.LS_CAPTURE_3 .. "}")
  ),

  ----------------------------------------------------------------------------------
  ---// ENVIRONMENTS // ------------------------------------------------------------
  ----------------------------------------------------------------------------------

  s(
    snip("begin", "begin env", "", "autosnippet"),
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
  s(
    snip("multline", "multline env", ""),
    fmta(
      [[\begin{multline}
        <>
    \end{multline}]],
      i(1)
    )
  ),
  s(
    snip("align", "align env", "", "autosnippet"),
    fmta(
      [[
        \begin{align}
          <>
        \end{align}
      ]],
      i(0)
    )
  ),
  s(
    snip("([bBpvV])matrix", "matrix envs", "", "autosnippet", true, "pattern"),
    fmta(
      [[
        \begin{<t>matrix}
          <>
        \end{<t>matrix}
      ]],
      { t = l(l.LS_CAPTURE_1), i(0) }
    )
  ),
}
