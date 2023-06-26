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
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require "luasnip.util.types"
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet

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
}
