local options = {
  compile = true,
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  overrides = function(colors)
    local theme = colors.theme
    return {
      NormalFloat = { bg = "NONE" },
      FloatBorder = { bg = "NONE" },
      FloatTitle = { bg = "NONE" },

      -- Save an hlgroup with dark background and dimmed foreground
      -- so that you can use it where your still want darker windows.
      -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

      BufferInactive = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
      BufferInactiveSign = { fg = theme.ui.bg, bg = theme.ui.bg_p1 },

      BufferCurrent = { fg = theme.ui.fg, bg = theme.ui.bg_m2 },
      BufferCurrentSign = { fg = theme.ui.bg, bg = theme.ui.bg_m2 },
      -- BufferSign = { bg = theme.ui.bg_m3 },

      -- Popular plugins that open floats will link to NormalFloat by default;
      -- set their background accordingly if you wish to keep them dark and borderless
      -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

      -- More uniform colors for the popup menu.
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_m3 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
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
}

return options
