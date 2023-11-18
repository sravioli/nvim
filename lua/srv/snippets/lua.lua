---@diagnostic disable: undefined-global
-- luacheck: ignore 113
return {
  s(
    { trig = "snip", dscr = "add LuaSnip snippet" },
    fmta([[s({ trig = "<>", dscr = "<>" }, <>),]], { i(1), i(2), i(3, "{}") })
  ),
  s(
    { trig = "asnip", dscr = "add LuaSnip autosnippet" },
    fmta(
      [[
        s(
          { trig = "<>", dscr = "<>", snippetType = "autosnippet" },
          t { "<>" }
        ),
      ]],
      { i(1), i(2), i(3, "{}") }
    )
  ),
}
