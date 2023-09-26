---@diagnostic disable: undefined-global
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
      > [!note] {title}
      >
      > {body}
      

      ]],
      { title = i(1, "Nota"), body = i(2) }
    )
  ),

  s(
    { trig = "abstract", dscr = "Python Markdown abstract block" },
    fmt(
      [[
      > [!abstract] {title}
      >
      > {body}

      ]],
      { title = i(1, "Sommario"), body = i(2) }
    )
  ),

  s(
    { trig = "info", dscr = "Python Markdown info block" },
    fmt(
      [[
      > [!info] {title}
      >
      > {body}

      ]],
      { title = i(1, "Info"), body = i(2) }
    )
  ),

  s(
    { trig = "tip", dscr = "Python Markdown tip block" },
    fmt(
      [[
      > [!tip] {title}
      >
      > {body}

      ]],
      { title = i(1, "Consiglio"), body = i(2) }
    )
  ),

  s(
    { trig = "success", dscr = "Python Markdown success block" },
    fmt(
      [[
      > [!success] {title}
      >
      > {body}

      ]],
      { title = i(1, "Successo"), body = i(2) }
    )
  ),

  s(
    { trig = "question", dscr = "Python Markdown question block" },
    fmt(
      [[
      > [!question] {title}
      >
      > {body}

      ]],
      { title = i(1, "Domanda"), body = i(2) }
    )
  ),

  s(
    { trig = "warning", dscr = "Python Markdown warning block" },
    fmt(
      [[
      > [!warning] {title}
      >
      > {body}

      ]],
      { title = i(1, "Attenzione"), body = i(2) }
    )
  ),

  s(
    { trig = "failure", dscr = "Python Markdown failure block" },
    fmt(
      [[
      > [!failure] {title}
      >
      > {body}
      
      ]],
      { title = i(1, "Errore"), body = i(2) }
    )
  ),

  s(
    { trig = "danger", dscr = "Python Markdown danger block" },
    fmt(
      [[
      > [!danger] {title}
      >
      > {body}

      ]],
      { title = i(1, "Pericolo"), body = i(2) }
    )
  ),

  s(
    { trig = "bug", dscr = "Python Markdown bug block" },
    fmt(
      [[
      > [!bug] {title}
      >
      > {body}

      ]],
      { title = i(1, "Bug"), body = i(2) }
    )
  ),

  s(
    { trig = "example", dscr = "Python Markdown example block" },
    fmt(
      [[
      > [!example] {title}
      >
      > {body}
      
      ]],
      { title = i(1, "Esempio"), body = i(2) }
    )
  ),

  s(
    { trig = "quote", dscr = "Python Markdown quote block" },
    fmt(
      [[
      > [!quote] {title}
      >
      > {body}

      ]],
      { title = i(1, "Author"), body = i(2) }
    )
  ),
  s(
    { trig = "obsmeta", dscr = "Add Obsidian YAML metadata" },
    fmt(
      [[
      ---
      aliases: [{aliases}]
      tags: [{tag_camel_case}, {tag_initials}]
      title: {title}
      description: {desc}
      author: sRavioli
      created: {date}
      updated: {date}
      ---

      ]],
      {
        aliases = i(1),
        tag_camel_case = i(2, "DocumentTag"),
        tag_initials = l(l._1:gsub("%l", ""):gsub("%W", ""), 2),
        title = i(3, "titolo"),
        desc = i(4, "descrizione"),
        date = f(function()
          return os.date "%Y-%m-%d %H:%M"
        end),
      }
    )
  ),
}
