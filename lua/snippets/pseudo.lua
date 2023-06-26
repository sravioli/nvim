local present, ls = pcall(require, "luasnip")
if not present then
  return
end

local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
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

local function array_format(str, elem)
  local array, pos = str:match "^([%a_]+)%[([%w_]+)%]$"
  if not (array and pos) then
    return str
  end

  return string.format("%s in posizione %s di %s", elem, pos, array)
end

return {
  -- operators
  s({ trig = "==", dscr = "equality operator" }, t "="),
  s({ trig = "is", dscr = "equality operator" }, t "="),
  s({ trig = "!=", dscr = "inequality operator" }, t "<>"),
  s({ trig = "neq", dscr = "inequality operator" }, t "<>"),
  s({ trig = "&&", dscr = "logical and" }, t "AND"),
  s({ trig = "and", dscr = "logical and" }, t "AND"),
  s({ trig = "||", dscr = "logical or" }, t "OR"),
  s({ trig = "or", dscr = "logical or" }, t "OR"),
  s({ trig = "!", dscr = "logical not" }, t "NOT"),
  s({ trig = "not", dscr = "logical not" }, t "NOT"),
  s({ trig = "f", dscr = "equivalent of false" }, t "FALSE"),
  s({ trig = "t", dscr = "equivalent of true" }, t "TRUE"),
  s({ trig = "istrue", dscr = "check if true" }, fmt([[{} = TRUE]], i(1))),
  s({ trig = "isfalse", dscr = "check if false" }, fmt([[{} = FALSE]], i(1))),

  -- utils
  s({ trig = "let", dscr = "declare a variable" }, fmt("{} := {}", { i(1), i(2) })),
  s({ trig = "pri", dscr = "print a string" }, fmt('StampareAVideo("{}")', i(1))),
  s({ trig = "priv", dscr = "print a variable" }, fmt("StampareAVideo({})", i(1))),
  s(
    { trig = "scan", dscr = "get input from keyboard" },
    fmt("{} := LeggereDaTastiera()", i(1))
  ),
  s(
    { trig = "fileread", dscr = "read from file" },
    fmt('{} := LeggereDaFile("{}")', { i(1), i(2, "filename") })
  ),
  s(
    { trig = "filewrite", dscr = "write to file" },
    fmt('{} := ScrivereSuFile("{}")', { i(1), i(2, "filename") })
  ),
  s({ trig = "tostr", dscr = "convert to string" }, fmt("int_to_str({})", i(1))),
  s({ trig = "toint", dscr = "convert to integer" }, fmt("str_to_int({})", i(1))),
  s(
    { trig = "fopen", dscr = "open and close a file" },
    fmt(
      [[
      file := AprireFile({filename})
      SE (file non esiste) ALLORA 
        Uscire()
      FINE
      {}
      ChiudereFile(file)
      ]],
      { filename = i(1, "filename"), i(0) }
    )
  ),
  -- string utils
  s(
    { trig = "strlen", dscr = "get length of a string" },
    fmt("str_length({})", i(1, "string"))
  ),
  s(
    {
      trig = "stringlen",
      dscr = "get the length of a string and assign to variable",
    },
    fmt(
      "{s}_len := str_length({s})",
      { s = i(1, "string") },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = "strcopy", dscr = "copy a string" },
    fmt(
      "{s}_copy := str_copy({s})",
      { s = i(1, "string") },
      { repeat_duplicates = true }
    )
  ),
  -- postfix magic
  postfix({
    trig = ".ar",
    dscr = 'turn array[idx] to "elemento in posizione idx di array"',
    match_pattern = "[%a_]+%[[%w_]+%]$",
  }, {
    f(function(_, parent)
      return array_format(parent.snippet.env.POSTFIX_MATCH, "elemento")
    end, {}),
  }),
  postfix({
    trig = ".ch",
    dscr = 'turn string[idx] to "carattere in posizione idx di string"',
    match_pattern = "[%a_]+%[[%w_]+%]$",
  }, {
    f(function(_, parent)
      return array_format(parent.snippet.env.POSTFIX_MATCH, "carattere")
    end, {}),
  }),
  postfix({
    trig = ".=",
    dscr = 'turn line into a line of "="',
    match_pattern = "^(.-)$",
  }, {
    l(l.POSTFIX_MATCH:gsub(".", "=")),
  }),
  postfix({
    trig = ".-",
    dscr = 'turn line into a line of "-"',
    match_pattern = "^(.-)$",
  }, {
    l(l.POSTFIX_MATCH:gsub(".", "-")),
  }),
  postfix({
    trig = "++",
    dscr = "post increment expansion",
    match_pattern = "[%a_]+$",
  }, {
    l(l.POSTFIX_MATCH .. " := " .. l.POSTFIX_MATCH .. " + 1"),
  }),
  postfix({
    trig = "--",
    dscr = "post decrement expansion",
    match_pattern = "[%a_]+$",
  }, {
    l(l.POSTFIX_MATCH .. " := " .. l.POSTFIX_MATCH .. " - 1"),
  }),
  postfix({
    trig = "*=",
    dscr = "times equal expansion",
    match_pattern = "^[%a_]+%s$",
  }, {
    l(l.POSTFIX_MATCH .. ":= " .. l.POSTFIX_MATCH .. "* "),
  }),
  postfix({
    trig = "/=",
    dscr = "divide equal expansion",
    match_pattern = "^[%a_]+%s$",
  }, {
    l(l.POSTFIX_MATCH .. ":= " .. l.POSTFIX_MATCH .. "/ "),
  }),
  postfix({
    trig = "+=",
    dscr = "plus equal expansion",
    match_pattern = "^[%a_]+%s$",
  }, {
    l(l.POSTFIX_MATCH .. ":= " .. l.POSTFIX_MATCH .. "+ "),
  }),
  postfix({
    trig = "-=",
    dscr = "minus equal expansion",
    match_pattern = "^[%a_]+%s$",
  }, {
    l(l.POSTFIX_MATCH .. ":= " .. l.POSTFIX_MATCH .. "- "),
  }),

  -- declarations
  s({ trig = "title", dscr = "give a title to the new file" }, {
    i(1, "title"),
    t { "", "" },
    l(l._1:gsub(".", "="), 1),
  }),
  s(
    { trig = "fun", dscr = "declare a function" },
    fmt(
      [[
      FUNZIONE {}()
      {}
      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "=") .. string.rep("=", 11), 1),
      }
    )
  ),
  s(
    { trig = "subfun", dscr = "declare a sub-function" },
    fmt(
      [[
      FUNZIONE {}()
      {}
      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "-") .. string.rep("-", 11), 1),
      }
    )
  ),
  s(
    { trig = "funblock", dscr = "complete function declaration" },
    fmt(
      [[
      FUNZIONE {}()
      {}

      INPUT:
      - {}, {}, {};

      OUTPUT:
      - {}, {}, {};

      LAVORO:
      - {}, {}, {};

      ALGORITMO:

      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "=") .. string.rep("=", 11), 1),
        i(2, "name"),
        i(3, "description"),
        i(4, "type"),
        i(5, "name"),
        i(6, "description"),
        i(7, "type"),
        i(8, "name"),
        i(9, "description"),
        i(10, "type"),
      }
    )
  ),
  s(
    { trig = "subfunblock", dscr = "complete sub-function declaration" },
    fmt(
      [[
      FUNZIONE {}()
      {}

      INPUT:
      - {}, {}, {};

      OUTPUT:
      - {}, {}, {};

      LAVORO:
      - {}, {}, {};

      ALGORITMO:

      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "-") .. string.rep("-", 11), 1),
        i(2, "name"),
        i(3, "description"),
        i(4, "type"),
        i(5, "name"),
        i(6, "description"),
        i(7, "type"),
        i(8, "name"),
        i(9, "description"),
        i(10, "type"),
      }
    )
  ),
  s(
    { trig = "proc", dscr = "procedure declaration (no output)" },
    fmt(
      [[
      FUNZIONE {}()
      {}

      INPUT:
      - {}, {}, {};

      OUTPUT:
      - nullo, non restituisce nulla, vuoto.

      LAVORO:
      - {}, {}, {};

      ALGORITMO:
      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "=") .. string.rep("=", 11), 1),
        i(2, "name"),
        i(3, "description"),
        i(4, "type"),
        i(5, "name"),
        i(6, "description"),
        i(7, "type"),
      }
    )
  ),
  s(
    { trig = "funv", dscr = "complete function declaration (no input/output)" },
    fmt(
      [[
      FUNZIONE {}()
      {}

      INPUT:
      - nullo, non ha input.

      OUTPUT:
      - nullo, non ha output.

      LAVORO:
      - {}, {}, {};

      ALGORITMO:

      ]],
      {
        i(1, "function_name"),
        l(l._1:gsub(".", "=") .. string.rep("=", 11), 1),
        i(2, "name"),
        i(3, "description"),
        i(4, "type"),
      }
    )
  ),
  s(
    { trig = "in", dscr = "INPUT block" },
    fmt(
      [[
      INPUT:
      - {}, {}, {};

      ]],
      { i(1, "name"), i(2, "description"), i(3, "type") }
    )
  ),
  s(
    { trig = "out", dscr = "OUTPUT block" },
    fmt(
      [[
      OUTPUT:
      - {}, {}, {};

      ]],
      { i(1, "name"), i(2, "description"), i(3, "type") }
    )
  ),
  s(
    { trig = "work", dscr = "LAVORO block" },
    fmt(
      [[
      LAVORO:
      - {}, {}, {};

      ]],
      { i(1, "name"), i(2, "description"), i(3, "type") }
    )
  ),
  s({ trig = "alg", dscr = "ALGORITMO block" }, {
    t { "ALGORITMO:", "" },
  }),

  s({ trig = "noin", dscr = "INPUT block (void)" }, {
    t { "INPUT:", "- nullo, non ha input, vuoto." },
  }),
  s({ trig = "noout", dscr = "OUTPUT block (void)" }, {
    t { "OUTPUT:", "- nullo, non ha outpu, vuoto.." },
  }),
  s(
    { trig = "param", desc = "add a parameter the function description" },
    fmt([[- {}, {}, {}]], {
      i(1, "name"),
      i(2, "description"),
      i(3, "type"),
    })
  ),

  -- general syntax
  s(
    { trig = "if", dscr = "if statement" },
    fmt(
      [[
      SE ({}) ALLORA 
        {}
      FINE SE
      ]],
      { i(1, "condition"), i(2) }
    )
  ),
  s({ trig = "el", dscr = "else statement" }, {
    t { "ALTRIMENTI " },
    i(1),
  }),
  s(
    { trig = "ife", dscr = "if-else statement" },
    fmt(
      [[
      SE ({}) ALLORA 
        {}
      ALTRIMENTI 
        {}
      FINE SE
      ]],
      { i(1, "condition"), i(2), i(3) }
    )
  ),
  s(
    { trig = "elif", dscr = "else-if statement" },
    fmt(
      [[
      ALTRIMENTI SE ({}) ALLORA 
        {}
      FINE SE
      ]],
      { i(1, "condition"), i(2) }
    )
  ),
  s(
    { trig = "while", dscr = "while loop" },
    fmt(
      [[
      MENTRE ({})
        {}
      FINE MENTRE
      ]],
      { i(1, "condition"), i(0) }
    )
  ),
  s(
    { trig = "whilenot", dscr = "while loop (var different from)" },
    fmt(
      [[
      MENTRE ({} <> {})
        {}
      FINE MENTRE
      ]],
      { i(1, "var"), i(2, "from"), i(0) }
    )
  ),
  s(
    { trig = "do", dscr = "do-while loop" },
    fmt(
      [[
      ESEGUI
        {}
      FINCHÉ ({})
      FINE ESEGUI
      ]],
      { i(0), i(1, "condition") }
    )
  ),
  s(
    { trig = "for", dscr = "for loop" },
    fmt(
      [[
      {var} := {val}
      MENTRE ({var} {cond})
        {code}
        {var} := {var} + {inc}
      FINE MENTRE
      ]],
      {
        var = i(1, "var"),
        val = i(2, "0"),
        inc = i(3, "1"),
        cond = i(4),
        code = i(0),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = "fori", dscr = "for loop with i counter" },
    fmt(
      [[
      i := {val}
      MENTRE (i {cond})
        {code}
        i := i + {inc}
      FINE MENTRE
      ]],
      {
        val = i(1, "0"),
        inc = i(2, "1"),
        cond = i(3),
        code = i(0),
      }
    )
  ),
  s(
    { trig = "forstr", dscr = "for loop on a string" },
    fmt(
      [[
      {str}_len := str_length({str})
      {var} := {val}
      MENTRE ({var} < {str}_len)
        {code}
        {var} := {var} + {inc}
      FINE MENTRE
      ]],
      {
        str = i(1, "string"),
        var = i(2, "i"),
        val = i(3, "0"),
        inc = i(4, "1"),
        code = i(0),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = "getinput", dscr = "get input from user with a condition" },
    fmt(
      [[
      StampareAVideo("{ask}: ")
      {input} := LeggereDaTastiera()
      MENTRE ({cond})
        StampareAVideo("{err}")
        StampareAVideo("{ask}")
        {input} := LeggereDaTastiera()
      FINE MENTRE
      ]],
      {
        cond = i(1, "keep asking until"),
        ask = i(2, "get input"),
        input = i(3, "input"),
        err = i(4, "error!"),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = "getfn", dscr = "add a get method for a record" },
    fmt(
      [[
      FUNZIONE get_{field}()
      {}

      INPUT:
      - {record}, {rdesc}, {Record}.{optional_in}

      OUTPUT:
      - {field}, {desc}, {type}.

      ALGORITMO:
      {field} := valore {}del campo {field} di {record}
      ]],
      {
        field = i(1, "field"),
        l(l._1:gsub(".", "=") .. string.rep("=", 15), 1),
        record = i(2, "record"),
        rdesc = i(3, "description"),
        Record = l(l._1:sub(1, 1):upper() .. l._1:sub(2), 2),
        optional_in = i(4),
        desc = i(5, "description"),
        type = i(6, "type"),
        i(0),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = "setfn", dscr = "add a set method for a record" },
    fmt(
      [[
      FUNZIONE set_{field}()
      {}

      INPUT:
      - {record}, {thing} di cui aggiornare il campo {field}, {Record};
      - {value}, {vdesc} da impostare, {vtype};

      OUTPUT:
      - {record}, {thing} col campo {field} aggiornato, {Record}.

      ALGORITMO:
      valore del campo {field} di {record} := {value}
      ]],
      {
        field = i(1, "field"),
        l(l._1:gsub(".", "=") .. string.rep("=", 15), 1),
        record = i(2, "record"),
        Record = l(l._1:gsub("^%l", string.upper), 2),

        thing = i(3, "nome"),
        value = i(4, "value"),
        vdesc = i(5, "description"),
        vtype = i(6, "type"),
      },
      { repeat_duplicates = true }
    )
  ),

  s(
    { trig = "struct", dscr = "Declare a pseudocode struct" },
    fmt(
      [[
      {struct_upper}
      {line}

      Il tipo di dato {struct} deve essere rappresentato come un record composto da:
      - {first_dscr};
      - {second_dscr};

      RECORD {struct}:
      - {param}, {param_dscr}, {param_type};
      - {other_param}, {other_param_dscr}, {other_param_type}.

      FUNZIONI DI ACCESSO
      ===================
      ]],
      {
        struct = i(1, "record"),
        line = l(l._1:gsub(".", "="), 1),

        struct_upper = l(l._1:upper(), 1),
        first_dscr = i(2, "descrizione del primo parametro"),
        second_dscr = i(3, "descrizione del secondo parametro"),

        param = i(4, "nome"),
        param_dscr = i(5, "descrizione"),
        param_type = i(6, "tipo"),

        other_param = i(7, "altro nome"),
        other_param_dscr = i(8, "altro descrizione"),
        other_param_type = i(9, "altro tipo"),
      }
    )
  ),

  s(
    {
      trig = "accessfns",
      dscr = "Both get and set functions in a single snipppet",
    },
    fmt(
      [[
      FUNZIONE get_{field}()
      {line}

      Restituisce il valore del campo {field} del record {record_type}.

      INPUT:
      - {record}, {record_dscr} di cui leggere {field_dscr}, {record_type}.

      OUTPUT:
      - {field}, valore del {field_dscr} del {record_dscr}, {field_type}.

      ALGORITMO:
      {field} := valore del campo {field} di {record}

      FUNZIONE set_{field}()
      {line}

      Aggiorna il valore del campo {field} del record {record_type} con quello ricevuto.

      INPUT:
      - {record}, {record_dscr} di cui aggiornare {field_dscr}, {record_type};
      - {field}, valore del {field_dscr} da impostare, {field_type}.

      OUTPUT:
      - {record}, {record_dscr} col valore aggiornato di {field_dscr}, {record_type}.

      ALGORITMO:
      valore del campo {field} di {record} := {field}
      ]],
      {
        field = i(1, "campo"),
        record = i(2, "record"),

        line = l(l._1:gsub(".", "=") .. string.rep("=", 15), 1),

        record_type = l(l._1:gsub("^%l", string.upper), 2),
        record_dscr = i(3, "descrizione record"),

        field_dscr = i(4, "descrizione campo"),
        field_type = i(5, "tipo"),
      },
      { repeat_duplicates = true }
    )
  ),

  s(
    {
      trig = "accessfnsat",
      dscr = "Both get and set functions at a position in a single snipppet",
    },
    fmt(
      [[
      FUNZIONE get_{field}()
      {line}

      Restituisce il valore del campo {field} del record {record_type} all'indice
      dato.

      INPUT:
      - {record}, {record_dscr} di cui leggere {field_dscr}, {record_type};
      - index, indice al quale leggere {field_dscr}, intero.

      OUTPUT:
      - {field}, valore del {field_dscr} del {record_dscr} all'indice dato, {field_type}.

      ALGORITMO:
      {field} := valore del campo {field} alla posizione index di {record}

      FUNZIONE set_{field}()
      {line}

      Aggiorna il valore del campo {field} del record {record_type} all'indice dato, con quello ricevuto.

      INPUT:
      - {record}, {record_dscr} di cui aggiornare {field_dscr}, {record_type};
      - index, indice al quale aggiornare il valore del campo {field}, intero;
      - {field}, valore {field_dscr} da impostare all'indice dato, {field_type}.

      OUTPUT:
      - {record}, {record_dscr} col valore aggiornato di {field_dscr}, {record_type}.

      ALGORITMO:
      valore del campo {field} alla posizione index di {record} := {field}
      ]],
      {
        field = i(1, "campo"),
        record = i(2, "record"),

        line = l(l._1:gsub(".", "=") .. string.rep("=", 15), 1),

        record_type = l(l._1:gsub("^%l", string.upper), 2),
        record_dscr = i(3, "descrizione record"),

        field_dscr = i(4, "descrizione campo"),
        field_type = i(5, "tipo"),
      },
      { repeat_duplicates = true }
    )
  ),
}
