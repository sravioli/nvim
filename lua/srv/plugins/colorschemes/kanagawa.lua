local function transparency()
  if vim.g.neovide then
    return false
  else
    return true
  end
end

return {
  ---NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
  "rebelot/kanagawa.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  build = ":KanagawaCompile",
  init = function() vim.cmd.colorscheme "kanagawa-wave" end,
  opts = {
    compile = true, -- enable compiling the colorscheme
    -- transparent = transparency(), -- do not set background color
    transparent = false,
    overrides = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },

        ---Save an hlgroup with dark background and dimmed foreground
        ---so that you can use it where your still want darker windows.
        ---E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
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

        ---Neotree
        NeoTreeTabInactive = { link = "BufferInactive" },
        NeoTreeTabActive = { link = "BufferCurrent" },
        NeoTreeTabBackground = { fg = theme.ui.bg, bg = theme.ui.bg },
        NeoTreeTabSeparatorInactive = { fg = theme.ui.bg_p1, bg = theme.ui.bg },
        NeoTreeTabSeparatorActive = { fg = theme.ui.bg_m2, bg = theme.ui.bg },

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

        ---Telescope
        TelescopeBorder = { link = "FloatBorder" },

        ---Nerd icons
        NerdIconNormal = { link = "NormalFloat" },
        NerdIconBorder = { link = "FloatBorder" },
      }
    end,
    colors = { theme = { all = { ui = { bg_gutter = "NONE" } } } },
  },
}
