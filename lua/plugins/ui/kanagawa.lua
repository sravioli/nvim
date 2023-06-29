return {
  -- NeoVim dark colorscheme inspired by the colors of the famous painting by
  -- Katsushika Hokusai.
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  build = ":KanagawaCompile",
  opts = {
    compile = true,
    transparent = true, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    commentStyle = { italic = false },
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = {
          fg = theme.ui.fg_dim,
          bg = theme.ui.bg_m1,
          blend = vim.o.pumblend,
        },

        -- Barbar highlight groups
        BufferInactive = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
        BufferInactiveSign = { fg = theme.ui.bg, bg = theme.ui.bg_p1 },
        BufferInactiveADDED = { fg = theme.diff.add, bg = theme.ui.bg_p1 },
        BufferInactiveCHANGED = { fg = theme.diff.change, bg = theme.ui.bg_p1 },
        BufferInactiveDELETED = { fg = theme.diff.delete, bg = theme.ui.bg_p1 },
        BufferInactiveERROR = { fg = theme.diag.error, bg = theme.ui.bg_p1 },
        BufferInactiveHINT = { fg = theme.diag.hint, bg = theme.ui.bg_p1 },
        BufferInactiveINFO = { fg = theme.diag.info, bg = theme.ui.bg_p1 },
        BufferInactiveWARN = { fg = theme.diag.warning, bg = theme.ui.bg_p1 },
        BufferInactiveMod = { fg = theme.ui.special, bg = theme.ui.bg_p1 },
        BufferInactiveTarget = {
          fg = theme.diag.error,
          bg = theme.ui.bg_p1,
          bold = true,
        },

        BufferCurrent = { fg = theme.ui.fg, bg = theme.ui.bg_m2 },
        BufferCurrentSign = { fg = theme.ui.bg, bg = theme.ui.bg_m2 },
        BufferCurrentADDED = { fg = theme.diff.add, bg = theme.ui.bg_m2 },
        BufferCurrentCHANGED = { fg = theme.diff.change, bg = theme.ui.bg_m2 },
        BufferCurrentDELETED = { fg = theme.diff.delete, bg = theme.ui.bg_m2 },
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

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

        -- More uniform colors for the popup menu.
        -- add `blend = vim.o.pumblend` to enable transparency
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p2, blend = vim.o.pumblend },
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_m3 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },

        -- Cmp
        CmpItemAbbrDeprecated = {
          fg = theme.syn.deprecated,
          bg = "NONE",
          strikethrough = true,
        },
        CmpItemAbbrMatch = { fg = theme.ui.bg_search, bg = "NONE", bold = true },
        CmpItemAbbrMatchFuzzy = { fg = theme.ui.bg_search, bg = "NONE", bold = true },
        CmpItemMenu = { fg = theme.ui.special, bg = "NONE", italic = true },

        -- CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
        -- CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
        -- CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

        CmpItemKindText = { fg = theme.ui.bg, bg = theme.syn.string },
        CmpItemKindEnum = { fg = theme.ui.bg, bg = theme.syn.string },
        CmpItemKindKeyword = { fg = theme.ui.bg, bg = theme.syn.string },

        CmpItemKindConstant = { fg = theme.ui.fg, bg = theme.syn.constant },
        CmpItemKindConstructor = { fg = theme.ui.fg, bg = theme.syn.constant },
        CmpItemKindReference = { fg = theme.ui.fg, bg = theme.syn.constant },

        CmpItemKindFunction = { fg = theme.ui.fg, bg = theme.syn.fun },
        CmpItemKindStruct = { fg = theme.ui.fg, bg = theme.syn.fun },
        CmpItemKindClass = { fg = theme.ui.fg, bg = theme.syn.fun },
        CmpItemKindModule = { fg = theme.ui.fg, bg = theme.syn.fun },
        CmpItemKindOperator = { fg = theme.ui.fg, bg = theme.syn.fun },

        CmpItemKindVariable = { fg = theme.ui.fg, bg = "#7E8294" },
        CmpItemKindFile = { fg = theme.ui.fg, bg = "#7E8294" },

        CmpItemKindUnit = { fg = theme.ui.fg, bg = theme.syn.type },
        CmpItemKindSnippet = { fg = theme.ui.fg, bg = theme.syn.type },
        CmpItemKindFolder = { fg = theme.ui.fg, bg = theme.syn.type },

        CmpItemKindMethod = { fg = theme.ui.fg, bg = theme.syn.identifier },
        CmpItemKindValue = { fg = theme.ui.fg, bg = theme.syn.identifier },
        CmpItemKindEnumMember = { fg = theme.ui.fg, bg = theme.syn.identifier },

        CmpItemKindInterface = { fg = theme.ui.fg, bg = theme.syn.parameter },
        CmpItemKindColor = { fg = theme.ui.fg, bg = theme.syn.parameter },
        CmpItemKindTypeParameter = { fg = theme.ui.fg, bg = theme.syn.parameter },

        -- Telescope
        TelescopeBorder = { link = "FloatBorder" },
      }
    end,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "NONE",
          },
        },
      },
    },
    theme = "dragon",
  },
  init = function()
    vim.cmd.colorscheme "kanagawa"
  end,
}
