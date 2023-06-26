local present, ls = pcall(require, "luasnip")
if not present then
  return
end

local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require "luasnip.util.types"
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet

return {
  s({ trig = "mi", dscr = "Inline math" }, fmt([[\({}\)]], i(1))),
  s(
    { trig = "mb", dscr = "Math block" },
    fmt(
      [[
      \[
        {}
      \]

      ]],
      i(1)
    )
  ),
  s(
    { trig = "mbs", dscr = "Math block short" },
    { t "\\[ ", i(1), t { " \\]", "" } }
  ),

  s(
    { trig = "note", dscr = "Python Markdown note block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! note "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Nota"), body = i(2) }
    )
  ),

  s(
    { trig = "abstract", dscr = "Python Markdown abstract block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! abstract "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Sommario"), body = i(2) }
    )
  ),

  s(
    { trig = "info", dscr = "Python Markdown info block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! info "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Info"), body = i(2) }
    )
  ),

  s(
    { trig = "tip", dscr = "Python Markdown tip block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! tip "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Consiglio"), body = i(2) }
    )
  ),

  s(
    { trig = "success", dscr = "Python Markdown success block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! success "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Successo"), body = i(2) }
    )
  ),

  s(
    { trig = "question", dscr = "Python Markdown question block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! question "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Domanda"), body = i(2) }
    )
  ),

  s(
    { trig = "warning", dscr = "Python Markdown warning block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! warning "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Attenzione"), body = i(2) }
    )
  ),

  s(
    { trig = "failure", dscr = "Python Markdown failure block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! failure "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Errore"), body = i(2) }
    )
  ),

  s(
    { trig = "danger", dscr = "Python Markdown danger block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! danger "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Pericolo"), body = i(2) }
    )
  ),

  s(
    { trig = "bug", dscr = "Python Markdown bug block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! bug "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Bug"), body = i(2) }
    )
  ),

  s(
    { trig = "example", dscr = "Python Markdown example block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! example "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Esempio"), body = i(2) }
    )
  ),

  s(
    { trig = "quote", dscr = "Python Markdown quote block" },
    fmt(
      [[
      <!-- markdownlint-disable code-block-style -->
      !!! quote "{title}"
          
          {body}
      <!-- markdownlint-enable code-block-style -->

      ]],
      { title = i(1, "Author"), body = i(2) }
    )
  ),
}
