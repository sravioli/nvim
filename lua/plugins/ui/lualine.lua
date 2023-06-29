return {
  -- A blazing fast and easy to configure neovim statusline plugin written in
  -- pure lua.
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "rebelot/kanagawa.nvim" },
  },
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = {
            left = 1,
            right = 0,
          },
        },
        { "filename" },
      },
      lualine_c = {
        { "branch", icon = "  ", color = "Comment" },
        {
          "diff",
          symbols = { added = "  ", modified = "  ", removed = "  " },
          -- source = diff_source,
        },
        {
          "diagnostics",
          sources = { "nvim_lsp", "nvim_diagnostic" },
          symbols = {
            error = "  ",
            warn = "  ",
            info = "  ",
            hint = "  ",
          },
        },
      },
      lualine_x = {
        { "encoding" },
        {
          "fileformat",
          icons_enabled = true,
          symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
          },
        },
      },
      lualine_y = {
        { "progress" },
      },
      lualine_z = {
        { "location" },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
      "lazy",
      "neo-tree",
      "trouble",
      "man",
      "fzf",
      "quickfix",
      "toggleterm",
    },
  },
}
