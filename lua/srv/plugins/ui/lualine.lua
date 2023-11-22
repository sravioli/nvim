return {
  ---A blazing fast and easy to configure neovim statusline plugin written in
  ---pure lua.
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "rebelot/kanagawa.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  event = "VeryLazy",
  opts = function()
    local icons = require("srv.preferences").icons
    local theme = require("kanagawa.colors").setup({ theme = "dragon" }).theme
    return {
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
          {
            "b:gitsigns_head",
            icon = icons.git.Branch,
            color = { fg = theme.syn.comment },
          },
          {
            "diff",
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            symbols = {
              error = " " .. icons.diagnostics.Error,
              warn = " " .. icons.diagnostics.Warn,
              info = " " .. icons.diagnostics.Info,
              hint = " " .. icons.diagnostics.Hint,
            },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          {
            "fileformat",
            icons_enabled = true,
            symbols = {
              unix = "", -- e712
              dos = "", -- e70f
              mac = "", -- e711
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
    }
  end,
}
