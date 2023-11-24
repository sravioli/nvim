--# selene: allow(mixed_table)

return {
  ---NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika
  ---Hokusai.
  "rebelot/kanagawa.nvim",
  priority = 1000,
  build = ":KanagawaCompile",
  init = function()
    require("kanagawa").load "wave"
  end,
  opts = {
    compile = true, -- enable compiling the colorscheme
    undercurls = true,
    transparent = false,
    keywordStyle = { italic = true, bold = true },
    overrides = function(colors)
      local theme = colors.theme

      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },

        ---Save an hlgroup with dark background and dimmed foreground so that you can use
        ---it where your still want darker windows. E.g.:
        ---autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = {
          fg = theme.ui.fg_dim,
          bg = theme.ui.bg_m1,
          blend = vim.o.pumblend,
        },

        ---Barbar highlight groups
        BufferInactive = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveSign = { fg = theme.ui.bg, bg = theme.ui.bg_p1 },
        BufferInactiveADDED = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveCHANGED = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveDELETED = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveERROR = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveHINT = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveINFO = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveWARN = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveMod = { fg = theme.syn.comment, bg = theme.ui.bg_p1 },
        BufferInactiveTarget = {
          fg = theme.diag.error,
          bg = theme.ui.bg_p1,
          bold = true,
        },

        BufferCurrent = { fg = theme.ui.fg, bg = theme.ui.bg_m2 },
        BufferCurrentSign = { fg = theme.ui.bg, bg = theme.ui.bg_m2 },
        BufferCurrentADDED = { fg = theme.vcs.added, bg = theme.ui.bg_m2 },
        BufferCurrentCHANGED = { fg = theme.vcs.changed, bg = theme.ui.bg_m2 },
        BufferCurrentDELETED = { fg = theme.vcs.removed, bg = theme.ui.bg_m2 },
        BufferCurrentERROR = { fg = theme.diag.error, bg = theme.ui.bg_m2 },
        BufferCurrentHINT = { fg = theme.diag.hint, bg = theme.ui.bg_m2 },
        BufferCurrentINFO = { fg = theme.diag.info, bg = theme.ui.bg_m2 },
        BufferCurrentWARN = { fg = theme.diag.warning, bg = theme.ui.bg_m2 },
        BufferCurrentMod = { fg = theme.ui.special, bg = theme.ui.bg_m2 },
        BufferCurrentTarget = {
          fg = theme.diag.error,
          bg = theme.ui.bg_m2,
          bold = true,
        },

        ---More uniform colors for the popup menu.
        ---add `blend = vim.o.pumblend` to enable transparency
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p2, blend = vim.o.pumblend },
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_m3 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },

        ---Cmp
        CmpItemAbbrDeprecated = {
          fg = theme.syn.deprecated,
          bg = "NONE",
          strikethrough = true,
        },
        CmpItemAbbrMatch = { fg = theme.ui.bg_search, bg = "NONE", bold = true },
        CmpItemAbbrMatchFuzzy = { fg = theme.ui.bg_search, bg = "NONE", bold = true },
        CmpItemMenu = { fg = theme.ui.special, bg = "NONE", italic = true },

        CmpItemKindField = { fg = theme.ui.bg, bg = theme.syn.identifier },
        CmpItemKindProperty = { fg = theme.ui.bg, bg = theme.syn.identifier },
        CmpItemKindEvent = { fg = theme.ui.bg, bg = theme.syn.identifier },

        CmpItemKindText = { fg = theme.ui.bg, bg = theme.syn.string },
        CmpItemKindEnum = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindKeyword = { fg = theme.ui.bg, bg = theme.syn.keyword },

        CmpItemKindConstant = { fg = theme.ui.bg, bg = theme.syn.constant },
        CmpItemKindConstructor = { fg = theme.ui.bg, bg = theme.syn.special1 },
        CmpItemKindReference = { fg = theme.ui.bg, bg = theme.syn.identifier },

        CmpItemKindFunction = { fg = theme.ui.bg, bg = theme.syn.fun },
        CmpItemKindStruct = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindClass = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindModule = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindOperator = { fg = theme.ui.bg, bg = theme.syn.operator },

        CmpItemKindVariable = { fg = theme.ui.bg, bg = theme.syn.parameter },
        CmpItemKindFile = { fg = theme.ui.bg, bg = theme.syn.parameter },

        CmpItemKindUnit = { fg = theme.ui.bg, bg = theme.syn.special2 },
        CmpItemKindSnippet = { fg = theme.ui.bg, bg = theme.syn.special2 },
        CmpItemKindFolder = { fg = theme.ui.bg, bg = theme.syn.special2 },

        CmpItemKindMethod = { fg = theme.ui.bg, bg = theme.syn.fun },
        CmpItemKindValue = { fg = theme.ui.bg, bg = theme.syn.fun },
        CmpItemKindEnumMember = { fg = theme.ui.bg, bg = theme.syn.constant },

        CmpItemKindInterface = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindColor = { fg = theme.ui.bg, bg = theme.syn.type },
        CmpItemKindTypeParameter = { fg = theme.ui.bg, bg = theme.syn.parameter },

        ---nvim-tree
        NvimTreeNormalFloat = { link = "NormalDark" },
        NvimTreeNormal = { link = "NormalDark" },

        ---Telescope
        TelescopeBorder = { link = "FloatBorder" },

        ---DropBari/WinBar
        -- WinBar = { fg = theme.ui.fg, bg = theme.ui.bg_m1, force = true },
        -- WinBarNC = { fg = theme.ui.fg, bg = theme.ui.bg_m1, force = true },
        --
        -- DropBarMenuNormalFloat = { bg = theme.ui.bg_m1 },
        -- DropBarIconKindClass = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindConstructor = { fg = theme.syn.special1, bg = theme.ui.bg_m1 },
        -- DropBarIconKindDeclaration = { fg = theme.syn.special2, bg = theme.ui.bg_m1 },
        -- DropBarIconKindEnum = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindEnumMember = { fg = theme.syn.constant, bg = theme.ui.bg_m1 },
        -- DropBarIconKindEvent = { fg = theme.syn.identifier, bg = theme.ui.bg_m1 },
        -- DropBarIconKindField = { fg = theme.syn.identifier, bg = theme.ui.bg_m1 },
        -- DropBarIconKindIdentifier = { fg = theme.syn.parameter, bg = theme.ui.bg_m1 },
        -- DropBarIconKindInterface = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindMethod = { fg = theme.syn.fun, bg = theme.ui.bg_m1 },
        -- DropBarIconKindModule = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindPackage = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindProperty = { fg = theme.syn.identifier, bg = theme.ui.bg_m1 },
        -- DropBarIconKindReference = { fg = theme.syn.identifier, bg = theme.ui.bg_m1 },
        -- DropBarIconKindStruct = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindType = { fg = theme.syn.type, bg = theme.ui.bg_m1 },
        -- DropBarIconKindTypeParameter = { fg = theme.syn.parameter, bg = theme.ui.bg_m1 },
        -- DropBarIconKindUnit = { fg = theme.syn.special2, bg = theme.ui.bg_m1 },
        -- DropBarIconKindVariable = { fg = theme.syn.parameter, bg = theme.ui.bg_m1 },
        -- DropBarIconUiSeparator = { fg = theme.syn.special1, bg = theme.ui.bg_m1 },
      }
    end,
    colors = { theme = { all = { ui = { bg_gutter = "NONE" } } } },
  },
}
