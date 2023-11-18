---@diagnostic disable: undefined-global
-- luacheck: ignore 113
return {
  s(
    { trig = "stylua", dscr = "stylua default config" },
    fmt(
      [[
        column_width = {column_width}
        line_endings = "{line_endings}"
        indent_type = "{indent_type}"
        indent_width = {indent_width}
        quote_style = "{quote_style}"
        call_parentheses = "{call_parentheses}"
        collapse_simple_statement = "{collapse_simple_statement}"

        [sort_requires]
        enabled = {sort_requires}
      ]],
      {
        column_width = i(1, "90"),
        line_endings = i(2, "Windows"),
        indent_type = i(3, "Spaces"),
        indent_width = i(4, "2"),
        quote_style = i(5, "AutoPreferDouble"),
        call_parentheses = i(6, "None"),
        collapse_simple_statement = i(7, "Always"),
        sort_requires = i(8, "false"),
      }
    )
  ),
}
