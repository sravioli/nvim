--# selene: allow (undefined_variable)
---@diagnostic disable: undefined-global
-- luacheck: ignore 113
return {
  s({ trig = "b", dscr = "bold", priority = 9999 }, fmt([[**{}**]], i(1))),
  s({ trig = "i", dscr = "italic", priority = 9999 }, fmt([[_{}_]], i(1))),
  s({ trig = "bi", dscr = "bold italic", priority = 9999 }, fmt([[**_{}_**]], i(1))),
  s({ trig = "ib", dscr = "italic bold", priority = 9999 }, fmt([[_**{}**_]], i(1))),
  s({ trig = "ci", dscr = "inline code", priority = 9999 }, fmt([[`{}`]], i(1))),
  s(
    { trig = "cb", dscr = "code block", priority = 9999 },
    fmt(
      [[
        ~~~{}
        {}
        ~~~
      ]],
      { i(1, "lang"), i(2) }
    )
  ),
  s({ trig = "mi", dscr = "Inline math" }, fmt([[${}$]], i(1))),
  s(
    { trig = "mb", dscr = "Math block" },
    fmt(
      [[
      $$
        {}
      $$

      ]],
      i(1)
    )
  ),
  s({ trig = "mbs", dscr = "Math block short" }, { t "$$ ", i(1), t { " $$", "" } }),

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
      aliases:
        - {aliases}
      tags:
        - {tag_camel_case}
        - {tag_initials}
      title: {title}
      description: >-
        {desc}
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

  s(
    { trig = "unimetadata", dscr = "Add Obsidian metadata for university notes" },
    fmt(
      [=[
      ---
      professore:
        {professore}, {email}
      ricevimento: {ricevimento}
      lezioni:
        {lezioni}
      esonero: {esonero}
      esame:
        pratico: {esame_pratico}
        scritto: {esame_scritto}
        orale: {esame_orale}
      CFU: {cfu}
      e-learning:
        uri: "https://elearning.uniba.it/course/view.php?id={elearning_id}"
        passwd: {elearning_passwd}
      libri:
        - "[[{libri}]]"{altri_libri}
      tags:
        - {tag_camel_case}
        - {tag_initials}
      aliases:
        - {aliases}{altri_alias}
      title: {title}
      description: >-
        {description}
      author: sRavioli
      created: {date_created}
      updated: {date_modified}
      ---

      ]=],
      {
        professore = i(1, "Nome Cognome"),
        email = f(function(args, _, _)
          -- local name, surname, second_surname =
          --   args[1][1]:lower():match "^(%w*)%s*(%w*)%s*(%w*)$"
          -- return string.format("%s.%s%s@uniba.it", name, surname, second_surname)
          return string.format(
            "%s.%s%s@uniba.it",
            args[1][1]:lower():match "^(%w*)%s*(%w*)%s*(%w*)$"
          )
        end, { 1 }),
        ricevimento = i(2, "orari di ricevimento"),
        lezioni = i(3, "giorno: orario"),
        esonero = c(4, { t { "assente" }, t { "presente" } }),
        esame_pratico = c(5, { t { "no" }, t { "sì" } }),
        esame_scritto = c(6, { t { "no" }, t { "sì" } }),
        esame_orale = c(7, { t { "no" }, t { "sì" } }),
        cfu = i(8, "7+2"),
        elearning_id = i(9, "id"),
        elearning_passwd = i(10, "passwd"),
        libri = i(11, "./books/libro.pdf"),
        altri_libri = i(12),
        tag_camel_case = i(13, "TagsDellaNota"),
        tag_initials = l(l._1:gsub("%l", ""):gsub("%W", ""), 13),
        aliases = l("scheda " .. l._1:gsub("%l", ""):gsub("%W", ""), 13),
        altri_alias = i(14),
        title = i(15, "titolo"),
        description = i(16, "descrizione"),
        date_created = f(function()
          return os.date "%Y-%m-%d %H:%M"
        end),
        date_modified = f(function()
          return os.date "%Y-%m-%d %H:%M"
        end),
      }
    )
  ),

  s(
    { trig = "cpsex", dscr = "Esercizio di Calcolo di Probabilità e Statistica" },
    fmt(
      [[
      **Traccia**: {}

      **Breve**:

      **Svolgimento**: {}
    ]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = "clibtemplate", dscr = "template per file di libreria C" },
    fmt(
      [[
        # {fun}()

        ## Descrizione

        {descr}

        ## Sintassi

        ~~~c
        {type} {pointer}{fun}({params});
        ~~~

        ### Parametri

        {params_list}

        ### Valore restituito

        {return_value}

        ## Esempio

        {example}
      ]],
      {
        fun = i(1, "main"),
        descr = i(2),
        type = i(3, "void"),
        pointer = c(4, { t "", t "*" }),
        params = i(5),
        params_list = d(6, function(args)
          vim.print(args)
          local params = vim.split(args[1][1], ", ")

          local tmp = {}
          for index, param in ipairs(params) do
            local txt
            local suffix = ""
            if string.find(param, "%a+%s?%*") then
              suffix = "puntatore a "
            end

            local tbl = { i(index) }
            txt = param:gsub("^.-(%*?%a+)$", "%1")
            if txt ~= "" then
              txt = ("- `%s`: %s"):format(txt, suffix)
              tbl = { t { txt }, i(index), t { "", "" } }
            end

            vim.list_extend(tmp, tbl)
          end

          return sn(nil, tmp)
        end, { 5 }),
        return_value = i(7),
        example = i(8),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),

  s(
    { trig = "csintax", dscr = "Dichiarazione funzione in C" },
    fmt(
      [[
        ## Sintassi

        ~~~c
        {code}
        ~~~

        ### Parametri

        {params}

        ### Valore restituito

        {ret}
      ]],
      {
        code = i(1),
        params = d(2, function(args)
          local params =
            vim.split(string.gsub(args[1][1], "^%a+%s*%*?%a+%((.-)%);$", "%1"), ", ")
          vim.print(params)

          local tmp = {}
          for index, param in ipairs(params) do
            local txt
            local suffix = ""
            if string.find(param, "%a+%s?%*") then
              suffix = "puntatore a "
            end

            txt = param:gsub("^.-(%*?%a+)$", "%1")
            txt = ("- `%s`: %s"):format(txt, suffix)

            vim.list_extend(tmp, { t { txt }, i(index), t { "", "" } })
          end

          return sn(nil, tmp)
        end, { 1 }),
        ret = i(0),
      }
    )
  ),
}
